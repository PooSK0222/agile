<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="receipt.aspx.cs" Inherits="js.receipt" %>

<!DOCTYPE html>

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
        }

        * {
            box-sizing: border-box;
        }

        /* style the container */
        .container {
            position: relative;
            border-radius: 5px;
            background-color: #f2f2f2;
            padding: 20px 0 30px 0;
        }

        /* style inputs and link buttons */
        input,
        .btn {
            width: 100%;
            padding: 12px;
            border-radius: 4px;
            margin: 5px 0;
            opacity: 0.85;
            display: inline-block;
            font-size: 17px;
            line-height: 20px;
            text-decoration: none; /* remove underline from anchors */
        }

            input:hover,
            .btn:hover {
                opacity: 1;
            }

        /* add appropriate colors to fb, twitter and google buttons */
        .fb {
            background-color: #3B5998;
            color: white;
        }

        .twitter {
            background-color: #55ACEE;
            color: white;
        }

        .google {
            background-color: #dd4b39;
            color: white;
        }

        /* style the submit button */
        input[type=submit] {
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
        }

            input[type=submit]:hover {
                background-color: #45a049;
            }

        /* Two-column layout */
        .col {
            float: left;
            width: 50%;
            margin: auto;
            padding: 0 50px;
            margin-top: 6px;
        }

        /* Clear floats after the columns */
        .row:after {
            content: "";
            display: table;
            clear: both;
        }

        /* vertical line */
        .vl {
            position: absolute;
            left: 50%;
            transform: translate(-50%);
            border: 2px solid #ddd;
            height: 175px;
        }

        /* text inside the vertical line */
        .vl-innertext {
            position: absolute;
            top: 50%;
            transform: translate(-50%, -50%);
            background-color: #f1f1f1;
            border: 1px solid #ccc;
            border-radius: 50%;
            padding: 8px 10px;
        }

        /* hide some text on medium and large screens */
        .hide-md-lg {
            display: none;
        }

        /* bottom container */
        .bottom-container {
            text-align: center;
            background-color: #666;
            border-radius: 0px 0px 4px 4px;
        }

        /* Responsive layout - when the screen is less than 650px wide, make the two columns stack on top of each other instead of next to each other */
        @media screen and (max-width: 650px) {
            .col {
                width: 100%;
                margin-top: 0;
            }
            /* hide the vertical line */
            .vl {
                display: none;
            }
            /* show the hidden text on small screens */
            .hide-md-lg {
                display: block;
                text-align: center;
                #my-node

        {
            background: blue;
            width: 100px;
            height: 100px;
            color: #fff;
        }

        }
    </style>
</head>
<body>



    <center><div class="container">
        <form id="form1" runat="server">

            <div id="my-node" style="background-color:white;">


                <div class="row">
                    <br />
                    <img src="images/CarWash2U%20logo.jpeg" width="320px" height="250px"/>
                    <br />
                    <h2 style="text-align: center"><b>Invoice</b></h2>
                    <h2 style="text-align: center">CarWash2U Car Wash Service Centre</h2>
                    <p>
                        HQ: Jalan USJ 2/2c, USJ 2, 47600 Subang Jaya, Selangor Malaysia
                <br />
                        Kepong Outlet: No. 3, Jalan 7A/62A, Bandar Manjalara, 52200 Kuala Lumpur
                    </p>
                    <p>------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------</p>
                    <br />
                    <center><table>
            <tr>
                <td>Admin ID</td><td><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Guest ID</td><td><asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Date</td><td><asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Payment Status</td><td><asp:TextBox ID="TextBox4" runat="server"></asp:TextBox></td>
            </tr>              
            <tr>
                <td>Total Price</td><td><asp:TextBox ID="TextBox5" runat="server"></asp:TextBox></td>
            </tr>
        </table></center>
                    <br />
                    <p>Thank you and Welcome Again.</p>
                </div>
            </div>
        </form>
        <button id="foo">Download Invoice</button>
    </div></center>


    <div class="bottom-container">
        <div class="row">
            <div class="col" style="color:green">
                <a href="WalkInService.aspx" style="color: white" class="btn"><b>Back To Walk In Service</b></a>
            </div>
            <div class="col">
                <a href="homepage.aspx" style="color: white" class="btn"><b>Go To Home Page</b></a>
            </div>
        </div>
    </div>

</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/dom-to-image/2.6.0/dom-to-image.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/2.0.0/FileSaver.min.js"></script>
<script>
var node = document.getElementById('my-node');
var btn = document.getElementById('foo');

btn.onclick = function() {
  domtoimage.toBlob(document.getElementById('my-node'))
    .then(function(blob) {
      window.saveAs(blob, 'invoice.png');
    });
}
</script>
</html>
