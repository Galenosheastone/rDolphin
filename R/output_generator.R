
#Calculation of output variables (quantification, fitting_error,$chemical_shift,signal_area_ratio,intensity, half bandwidth) and plot variables


output_generator = function(signals_to_quantify,
                            fitted_signals,
                            Ydata,
                            Xdata,
                            signals_parameters,multiplicities,buck_step) {

  fitted_signals[is.na(fitted_signals)]=0 #to be sure that there are no NA values on the fitted signals
  BGsignals = (multiplicities == 0) #finds baseline signals
  output_data = list()
ROI_buckets=seq_along(Ydata)
  #Storage of signals and sum of baseline and metabolite signals
  output_data$signals = fitted_signals[!BGsignals, , drop =F]
  output_data$signals_sum = colSums(fitted_signals[!BGsignals, , drop =F], na.rm = T)
  output_data$baseline_sum = colSums(fitted_signals[BGsignals, , drop =F], na.rm = T)
  output_data$fitted_sum = output_data$signals_sum + output_data$baseline_sum
  #For every signal I locate in which bins where most of the signal is located and I calculate the fitting error and the signal to area ratio
  for (ind in which(BGsignals==F)) {
    #I sort bins according to intensity of signal in each bin.
     sorted_bins=sort(fitted_signals[ind,ROI_buckets]/sum(fitted_signals[ind,ROI_buckets ]),decreasing=T,index.return=T)
    if(length(sorted_bins$x)>0) {
      #I select bins that make a cumulative sum of 90% of total area of the signal
      bins= sorted_bins$ix[1:which.min(abs(cumsum(sorted_bins$x)-0.9))]
    } else {
      bins=seq_along(ROI_buckets)
    }


    subregion_fitted = output_data$fitted_sum[ROI_buckets[bins]] #fitted spectrum
    subregion_signals = fitted_signals[ind, ROI_buckets[bins]] #fitted signals
    subregion_spectrum = Ydata[ROI_buckets[bins]] #original spectrum
    #I calculate how much the quantified signal represents the total spectrum in the region where the region is located.
    output_data$signal_area_ratio = append(output_data$signal_area_ratio, 100 -((abs(sum(subregion_spectrum) - sum(subregion_signals)) / sum(subregion_spectrum)) * 100))
    # normalized_rmse=cor(subregion_spectrum, subregion_fitted)
    normalized_rmse=summary(lm(subregion_spectrum~subregion_fitted))$sigma/max(subregion_spectrum)
if (sum(subregion_signals)==0) normalized_rmse=100
    output_data$fitting_error = append(output_data$fitting_error,normalized_rmse)
  }
  sorted_bins=sort(output_data$fitted_sum[ROI_buckets]/sum(output_data$fitted_sum[ROI_buckets]),decreasing=T,index.return=T)
  if(length(sorted_bins$x)>0) {
    bins= sorted_bins$ix[1:which.min(abs(cumsum(sorted_bins$x)-0.9))]
  } else {
    bins=seq_along(ROI_buckets)
  }

  subregion_fitted = output_data$fitted_sum[ROI_buckets[bins]]
  subregion_spectrum = Ydata[ROI_buckets[bins]]
  error1=summary(lm(subregion_spectrum~subregion_fitted))$sigma/max(subregion_spectrum)
  output_data$quantification = rowSums(fitted_signals[!BGsignals, , drop =
                                              F])*buck_step
  output_data$quantification[-signals_to_quantify]=NA

  output_data$chemical_shift = signals_parameters[2, !BGsignals]
  output_data$intensity=signals_parameters[1, !BGsignals]
  output_data$half_bandwidth=signals_parameters[3,!BGsignals ]
  dummy=list(output_data=output_data,error1=error1)
  return(dummy)
}
