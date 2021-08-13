source('./r_files/flatten_HTML.r')

############### Library Declarations ###############
libraryRequireInstall("ggplot2");
libraryRequireInstall("plotly");
libraryRequireInstall("forecast");
library("plotly")
library("forecast")
library("ggplot2")

##################################################################

################### Actual code ##################################
################### Initialiaze the format components ############
#################### ETS #########################################
if (!exists("ETS_show"))
{
  ETS_show <- T;#Length Forecast
}
if (!exists("ETS_ForecastLength"))
{
  ETS_ForecastLength <- "12";#Length Forecast
}
if (!exists("ETS_Error"))
{
  ETS_Error <- "Z";#Error
}
if (!exists("ETS_Trend"))
{
  ETS_Trend <- "Z";#Trend
}
if (!exists("ETS_Seasonal"))
{
 ETS_Seasonal <- "Z";#Seasonal
}

##################################################################
#################### ARIMA #######################################
if (!exists("ARIMA_show"))
{
  ARIMA_show <- F;#Length Forecast
}
if (!exists("ARIMA_ForecastLength"))
{
  ARIMA_ForecastLength <- "12";#Length Forecast
}


##################################################################
#################### STLM ########################################
if (!exists("STLM_show"))
{
  STLM_show <- F;#Length Forecast
}
if (!exists("STLM_ForecastLength"))
{
  STLM_ForecastLength <- "12";#Length Forecast
}

##################################################################
#################### TSLM ########################################
if (!exists("TSLM_show"))
{
  TSLM_show <- F;#Length Forecast
}
if (!exists("TSLM_ForecastLength"))
{
  TSLM_ForecastLength <- "12";#Length Forecast
}

##################################################################
#################### NNETAR ######################################
if (!exists("NNETAR_show"))
{
  NNETAR_show <- F;#Length Forecast
}
if (!exists("NNETAR_ForecastLength"))
{
  NNETAR_ForecastLength <- "12";#Length Forecast
}


##################################################################
if (!exists("IDC_show"))
{
  IDC_show <- F
}
if (!exists("IDC_IC_color9"))
{
  IDC_IC_color9<- "#8dbce9"
}
if (!exists("IDC_IC_color8"))
{
  IDC_IC_color8<- "#b3b3b3"
}
if (!exists("FormatP_Title"))
{
  FormatP_Title <- "Cash Flow Forecast"
}
if (!exists("FormatP_Xaxis"))
{
  FormatP_Xaxis <- "Time"
}

if (!exists("FormatP_Yaxis"))
{
  FormatP_Yaxis <- "Cash Flow Value"
}
if (!exists("FormatP_ColorO"))
{
  FormatP_ColorO <- "#2600ff"
}
if (!exists("FormatP_ColorP"))
{
  FormatP_ColorP <- "#ff0000"
}

if (!exists("Exp_Export"))
{
  Exp_Export <- F
}
if (!exists("Exp_PExport"))
{
  Exp_PExport <- "C:/Documents/Export_data_pred.csv"
}
if (!exists("Tooltip_TTitreO"))
{
  Tooltip_TTitreO <- "Saisir un titre"
}
if (!exists("Tooltip_TTitreP"))
{
  Tooltip_TTitreP <- "Saisir un titre"
}






Values <- data.frame(W, X, Y)

#names(Values)[1] <- "W"
names(Values)[1] <- "W"
names(Values)[2] <- "X"
names(Values)[3] <- "Y"

if (isTRUE(ETS_show)){
#tms= ts(Y,start = c(1970,1), end=c(1983,12),frequency = as.integer(Algorithm_ForecastLength))
tms= ts(Y,start = min(W), end=max(W), 12)# frequency = as.integer(Algorithm_ForecastLength))
ets_model = ets(tms, model= gsub(" ","",(paste(ETS_Error,ETS_Trend,ETS_Seasonal))))

ets_forecast = forecast(ets_model, h = as.integer(ETS_ForecastLength))


}


if (isTRUE(STLM_show)){
#tms= ts(Y,start = c(1970,1), end=c(1983,12),frequency = as.integer(Algorithm_ForecastLength))
tms= ts(Y,start = min(W), end=max(W), 12)
ets_model = stlm(tms)

ets_forecast = forecast(ets_model, h = as.integer(STLM_ForecastLength)*2)

}
if (isTRUE(TSLM_show)){
#tms= ts(Y,start = c(1970,1), end=c(1983,12),frequency = as.integer(Algorithm_ForecastLength))
  tms= ts(Y,start = min(W), frequency = 12)
  #if (is.integer(X)==FALSE){
  #  tms = ts(Y,start = (min(as.integer((format(as.Date(W),"%Y"))))), frequency = 12)
  #}

ets_model = tslm(tms ~ trend + season)

ets_forecast = forecast(ets_model, h = as.integer(TSLM_ForecastLength)*2)

}
if (isTRUE(ARIMA_show)){
#tms= ts(Y,start = c(1970,1), end=c(1983,12),frequency = as.integer(Algorithm_ForecastLength))
tms= ts(Y,start = min(W), end=max(W), 12)# frequency = as.integer(Algorithm_ForecastLength))
ets_model = auto.arima(tms)

ets_forecast = forecast(ets_model, h = as.integer(ARIMA_ForecastLength))


}
if (isTRUE(NNETAR_show)){
#tms= ts(Y,start = c(1970,1), end=c(1983,12))#frequency = as.integer(Algorithm_ForecastLength))
tms= ts(Y,start = min(W), end=max(W),12) # frequency = as.integer(Algorithm_ForecastLength))
ets_model = nnetar(tms)

ets_forecast = forecast(ets_model, h = as.integer(NNETAR_ForecastLength)*2)


}
if (isTRUE(Exp_Export)){
  write.table(ets_forecast, Exp_PExport, row.names = FALSE)
}
p <- plot_ly() %>%
    add_trace(x = ~time(tms), y = ~tms, name= "Observation",type = 'scatter', mode = 'markers',
            line = list(color= FormatP_ColorO),
            text = Tooltip_TTitreO,
            hovertemplate = paste(
            "<b>%{text}</b><br><br>",
            "%{yaxis.title.text}: %{y:$,.0f}<br>",
            "Year: %{x:.0f}",
            "<extra></extra>")) %>%
    add_lines(x = time(ets_forecast$mean), y = ets_forecast$mean, color = I(FormatP_ColorP), name = "Prediction",hoveron = "points", 
            text = Tooltip_TTitreP,
            hovertemplate = paste(
            "<b>%{text}</b><br><br>",
            "%{yaxis.title.text}: %{y:$,.0f}<br>",
            "Year: %{x:.0f}",
            "<extra></extra>"))%>%
    layout(title = FormatP_Title,
         xaxis = list(title = FormatP_Xaxis

                      ),
         yaxis = list(title = FormatP_Yaxis
                      ))

if (isTRUE(IDC_show) && isFALSE(NNETAR_show)) {
  p <- plot_ly() %>%
    add_trace(x = ~time(tms), y = ~tms,name= "Observation", type = 'scatter', mode = 'markers',
            line = list(color= FormatP_ColorO),
            text = Tooltip_TTitreO,
            hovertemplate = paste(
            "<b>%{text}</b><br><br>",
            "%{yaxis.title.text}: %{y:$,.0f}<br>",
            "Year: %{x:.0f}",
            "<extra></extra>")) %>%
    add_ribbons(x = time(ets_forecast$mean), ymin = ets_forecast$lower[, 2], ymax = ets_forecast$upper[, 2],
                color = I(IDC_IC_color9), name = "95% confidence") %>%
    add_ribbons(x = time(ets_forecast$mean), ymin = ets_forecast$lower[, 1], ymax = ets_forecast$upper[, 1],
                color = I(IDC_IC_color8), name = "80% confidence") %>%
    add_lines(x = time(ets_forecast$mean), y = ets_forecast$mean, color = I(FormatP_ColorP), name = "Prediction",hoveron = "points", 
            text = Tooltip_TTitreP,
            hovertemplate = paste(
            "<b>%{text}</b><br><br>",
            "%{yaxis.title.text}: %{y:$,.0f}<br>",
            "Year: %{x:.0f}",
            "<extra></extra>"))%>%
    layout(title = FormatP_Title,
         xaxis = list(title = FormatP_Xaxis

                      ),
         yaxis = list(title = FormatP_Yaxis
                      ))


}



####################################################

############# Create and save widget ###############
internalSaveWidget(p, "out.html");
####################################################
