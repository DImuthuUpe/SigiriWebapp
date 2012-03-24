<%-- 
    Document   : warehouse
    Created on : Feb 26, 2012, 11:05:55 AM
    Author     : Pancha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Sigiri - Stock Management</title>
        <link rel="stylesheet" href="css/div_styles.css" type="text/css" />
        <link rel="stylesheet" href="css/button.css" type="text/css"/>
        <link type="text/css" href="css/menu.css" rel="stylesheet" />

        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/menu.js"></script>
    </head>

    <body>
        <div class="container">
            <table width="1199" height="114">
                <tr>
                    <td width="116" height="108"><center><img src="images/logo.png"/></center></td>
                    <td width="607" style="padding-left:8px;color:#000079;font-size:22px;">

                        <p>Sigiri Textile Industries (Pvt) Ltd.</p>
                        <p>No:227/1,
                            Galle Road,Katubedda,
                            Mt.Lavinia,
                            Sri Lanka. </p></td>
                    <td width="460">&nbsp;</td>
                </tr>
            </table>
            <table width="1200">
                <tr>


                    <td width="197">&nbsp;</td>
                    <td width="784">
                        <div id="menu">
                            <ul class="menu">
                                <li><a href="menu.jsp" class="parent"><span>Home</span></a>
                                    <div><ul>
                                            <li><a href="#" class="parent"><span>Sub Item 1</span></a>
                                                <div><ul>
                                                        <li><a href="#" class="parent"><span>Sub Item 1.1</span></a>
                                                            <div><ul>
                                                                    <li><a href="#"><span>Sub Item 1.1.1</span></a></li>
                                                                    <li><a href="#"><span>Sub Item 1.1.2</span></a></li>
                                                                </ul></div>
                                                        </li>
                                                        <li><a href="#"><span>Sub Item 1.2</span></a></li>
                                                        <li><a href="#"><span>Sub Item 1.3</span></a></li>
                                                        <li><a href="#"><span>Sub Item 1.4</span></a></li>
                                                        <li><a href="#"><span>Sub Item 1.5</span></a></li>
                                                        <li><a href="#"><span>Sub Item 1.6</span></a></li>
                                                        <li><a href="#" class="parent"><span>Sub Item 1.7</span></a>
                                                            <div><ul>
                                                                    <li><a href="#"><span>Sub Item 1.7.1</span></a></li>
                                                                    <li><a href="#"><span>Sub Item 1.7.2</span></a></li>
                                                                </ul></div>
                                                        </li>
                                                    </ul></div>
                                            </li>
                                            <li><a href="#"><span>Sub Item 2</span></a></li>
                                            <li><a href="#"><span>Sub Item 3</span></a></li>
                                        </ul></div>
                                </li>
                                <li><a href="#" class="parent"><span>Product Info</span></a>
                                    <div><ul>
                                            <li><a href="#" class="parent"><span>Sub Item 1</span></a>
                                                <div><ul>
                                                        <li><a href="#"><span>Sub Item 1.1</span></a></li>
                                                        <li><a href="#"><span>Sub Item 1.2</span></a></li>
                                                    </ul></div>
                                            </li>

                                            <li><a href="#" class="parent"><span>Sub Item 2</span></a>
                                                <div><ul>
                                                        <li><a href="#"><span>Sub Item 2.1</span></a></li>
                                                        <li><a href="#"><span>Sub Item 2.2</span></a></li>
                                                    </ul></div>
                                            </li>
                                            <li><a href="#"><span>Sub Item 3</span></a></li>
                                            <li><a href="#"><span>Sub Item 4</span></a></li>
                                            <li><a href="#"><span>Sub Item 5</span></a></li>
                                            <li><a href="#"><span>Sub Item 6</span></a></li>
                                            <li><a href="#"><span>Sub Item 7</span></a></li>
                                        </ul></div>
                                </li>
                                <li><a href="#" class="parent"><span>Product Info</span></a>
                                    <div><ul>
                                            <li><a href="#" class="parent"><span>Sub Item 1</span></a>
                                                <div><ul>
                                                        <li><a href="#"><span>Sub Item 1.1</span></a></li>
                                                        <li><a href="#"><span>Sub Item 1.2</span></a></li>
                                                    </ul></div>
                                            </li>

                                            <li><a href="#" class="parent"><span>Sub Item 2</span></a>
                                                <div><ul>
                                                        <li><a href="#"><span>Sub Item 2.1</span></a></li>
                                                        <li><a href="#"><span>Sub Item 2.2</span></a></li>
                                                    </ul></div>
                                            </li>
                                            <li><a href="#"><span>Sub Item 3</span></a></li>
                                            <li><a href="#"><span>Sub Item 4</span></a></li>
                                            <li><a href="#"><span>Sub Item 5</span></a></li>
                                            <li><a href="#"><span>Sub Item 6</span></a></li>
                                            <li><a href="#"><span>Sub Item 7</span></a></li>
                                        </ul></div>
                                </li>
                                <li><a href="#"><span>Help</span></a></li>
                                <li><a href="#"><span>Help</span></a></li>
                                <li><a href="#"><span>Help</span></a></li>
                                <li class="last"><a href="#"><span>Contacts</span></a></li>
                            </ul>
                        </div>


                    </td>
                    <td width="199" height="66">&nbsp;</td>
                </tr>



            </table>


            <table width="1203" height="454">
                <tr>
                    <td width="2" height="448">&nbsp;</td>
                    <td width="1189">
                        <table width="1151" height="437">
                            <tr>
                                <td></td>
                                <td>
                                    <div id="roll">
                                        <ul>
                                            <li><a href="#">PO Progress</a></li>
                                        </ul>
                                    </div>
                                </td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>
                                    <div id="roll">
                                        <ul>
                                            <li><a href="#">Purchase Order</a></li>
                                        </ul>
                                    </div>
                                </td>
                                <td>

                                </td>
                                <td></td>
                                <td></td>
                                <td height="94"></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><center><img src="images/down.png"/></center></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td><center><img src="images/down.png"/></center></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td height="72"></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <div id="roll">
                                        <ul>
                                            <li><a href="#">Add Requisition</a></li>
                                        </ul>
                                    </div>
                                </td>
                                <td><center><img src="images/left.png"/></center></td>
                                <td>
                                    <div id="roll">
                                        <ul>
                                            <li><a href="#">Edit Supplier</a></li>
                                        </ul>
                                    </div>
                                </td>
                                <td></td>
                                <td>
                                    <div id="roll">
                                        <ul>
                                            <li><a href="#">Search</a></li>
                                        </ul>
                                    </div>
                                </td>
                                <td>
                                    <center><img src="images/left.png"/></center>
                                </td>
                                <td>
                                    <div id="roll">
                                        <ul>
                                            <li><a href="#">Progress</a></li>
                                        </ul>
                                    </div>
                                </td>
                                <td>
                                    <center><img src="images/left.png"/></center>
                                </td>
                                <td height="90">
                                    <div id="roll">
                                        <ul>
                                            <li><a href="#">Reports</a></li>
                                        </ul>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><center><img src="images/down.png"/></center></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td><center><img src="images/down.png"/></center></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td height="79"></td>
                            </tr>
                            <tr>
                                <td width="87"></td>
                                <td width="111">
                                    <div id="roll">
                                        <ul>
                                            <li><a href="#">Requisition Progress</a></li>
                                        </ul>
                                    </div>
                                </td>
                                <td width="118">
                                    <center><img src="images/left.png"/></center>
                                </td>
                                <td width="122">
                                    <div id="roll">
                                        <ul>
                                            <li><a href="#">Add Issue Note</a></li>
                                        </ul>
                                    </div>
                                </td>
                                <td width="149"></td>
                                <td width="115">
                                    <div id="roll">
                                        <ul>
                                            <li><a href="#">Check</a></li>
                                        </ul>
                                    </div>
                                </td>
                                <td width="99">
                                    <center><img src="images/left.png"/></center>
                                </td>
                                <td width="107">
                                    <div id="roll">
                                        <ul>
                                            <li><a href="#">Approve</a></li>
                                        </ul>
                                    </div>
                                </td>
                                <td width="98">
                                    <center><img src="images/left.png"/></center>
                                </td>
                                <td width="101" height="88">
                                    <div id="roll">
                                        <ul>
                                            <li><a href="#">Reports</a></li>
                                        </ul>
                                    </div>

                                </td>
                            </tr>
                        </table>

                    </td>
                    <td width="10">&nbsp;</td>
                </tr>
            </table>

        </div>

    </body>
</html>
