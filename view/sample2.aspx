<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sample2.aspx.cs" Inherits="HighChartSample.view.sample2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>sample2</title>


    <script src="../Scripts/jquery-3.3.1.js" type="text/javascript"></script>
    <script src="../Scripts/highcharts.js" type="text/javascript"></script>

    <script>

        var options = <%=Session["options"]%>;

        document.addEventListener('DOMContentLoaded', function () {
            const chart = Highcharts.chart('container', {
                chart: {
                    zoomType: 'xy'
                },
                title: {
                    text: '使用量'
                },

                xAxis: [{
                    categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                        'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                    crosshair: true
                }],
                yAxis:[ { // Primary yAxis
                    labels: {
                        //format: '{value} kWh',
                        style: {
                            color: Highcharts.getOptions().colors[1]
                        },
                        allowDecimals: true,
                        formatter: function () {
                            return Highcharts.numberFormat(this.value, 0, '', ',') + ' kWh';
                        }
                    },
                    min:0,
                    title: {
                        text: '',
                        style: {
                            color: Highcharts.getOptions().colors[1]
                        }
                    }
                }],
                tooltip: {
                    shared: true
                },
                legend: {
                    layout: 'vertical',
                    align: 'right',
                    verticalAlign: 'top',
                    x: 0,
                    y: 0,
                    floating: true,
                    borderWidth: 0.5,
                    floating: true,
                    backgroundColor:
                        Highcharts.defaultOptions.legend.backgroundColor || // theme
                        'rgba(255,255,255,0.25)',
                    shadow: true
                },


                series: [{
                    name: '当年使用量',
                    type: 'column',
                    data: [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4],
                    tooltip: {
                        valueSuffix: ' kWh'
                    }

                }, {
                    name: '平均使用量',
                    type: 'spline',
                    data: options.data[1].value,
                    tooltip: {
                        valueSuffix: ' kWh'
                    }
                }]
            });
        });

    </script>


</head>
<body>
    <form id="form1" runat="server">

        <div id="container" style="width: 100%; height: 400px;"></div>
        <input type="text" id="test" />

    </form>

    <script>
        $('#test').val("<%=Session["test"]%>");

    </script>


</body>
</html>
