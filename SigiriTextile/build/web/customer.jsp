<%--
    Document   : customer
    Created on : Feb 26, 2012, 11:01:14 AM
    Author     : Pancha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s" %>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="icon" href="images/logo_link.png">
        <title>Sigiri - Stock Management</title>
        <link rel="stylesheet" href="css/div_styles.css" type="text/css" />
        <link rel="stylesheet" href="verticaltabs/css/verticaltabs.css" />
        <link rel="stylesheet" href="css/formstyle.css" type="text/css"/>

        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
        <script type="text/javascript" src="verticaltabs/js/verticaltabs.pack.js"></script> <!--http://dean.edwards.name/packer/-->

        <script type="text/javascript">
            $(document).ready(function(){
                $("#textExample").verticaltabs({speed: 500,slideShow: false,activeIndex:0});

            });
            function nameSelected(){

                var custId=$('#cmbEdit').val();

            <s:set name="myVar" value="Hoooo"/>
            <s:iterator value="list" var="customer">

                    if(${customer.id}==custId){
                        $("#eid").val('${customer.id}');
                        $("#ehid").val('${customer.id}');
                        $("#ename").val('${customer.name}');
                        $("#eaddress").val('${customer.address}');
                        $("#evat").val('${customer.vatnumber}');
                        $("#esvat").val('${customer.svatnumber}');
                        $("#etqb").val('${customer.tqbnumber}');
                        $("#etel").val('${customer.telephone}');
                        $("#efax").val('${customer.fax}');
                        $("#eown").val('${customer.owner}');
                    }

            </s:iterator>
                }

                function searchByName(){
                    var name = $("#searchname").val();
                    var innhtml='<thead><tr><td style="width:100px;height:40px;"><center>Name</center></td><td style="width:100px;height:40px;"><center>Address</center></td><td style="width:100px;height:40px;"><center>VAT No</center></td><td style="width:100px;height:40px;"><center>Telephone</center></td><td style="width:100px;height:40px;"><center>Fax</center></td><td style="width:100px;height:40px;"><center>Owner</center></td></tr></thead><tbody>';
                    <s:iterator value="list" var="customer">
                            if('${customer.name}'.search(new RegExp(name,"i"))>=0){

                                 innhtml=innhtml+'<tr><td style="width:100px;height:40px;"><s:property value="#customer.name" /></td><td style="width:100px;height:40px;"><s:property value="#customer.address" /></td><td style="width:100px;height:40px;"><s:property value="#customer.vatnumber" /></td><td style="width:100px;height:40px;"><s:property value="#customer.telephone" /></td><td style="width:100px;height:40px;"><s:property value="#customer.fax" /></td><td style="width:100px;height:40px;"><s:property value="#customer.owner" /></td></tr>';
                          }
                    </s:iterator>
                    innhtml= innhtml+"</tbody>";
                    $('#searchtable').html(innhtml);
                }
                function searchByAddress(){
                    var address = $("#searchaddress").val();
                    var innhtml='<thead><tr><td style="width:100px;height:40px;"><center>Name</center></td><td style="width:100px;height:40px;"><center>Address</center></td><td style="width:100px;height:40px;"><center>VAT No</center></td><td style="width:100px;height:40px;"><center>Telephone</center></td><td style="width:100px;height:40px;"><center>Fax</center></td><td style="width:100px;height:40px;"><center>Owner</center></td></tr></thead><tbody>';
                    <s:iterator value="list" var="customer">
                          if('${customer.address}'.search(new RegExp(address,"i"))>=0){

                                 innhtml=innhtml+'<tr><td style="width:100px;height:40px;"><s:property value="#customer.name" /></td><td style="width:100px;height:40px;"><s:property value="#customer.address" /></td><td style="width:100px;height:40px;"><s:property value="#customer.vatnumber" /></td><td style="width:100px;height:40px;"><s:property value="#customer.telephone" /></td><td style="width:100px;height:40px;"><s:property value="#customer.fax" /></td><td style="width:100px;height:40px;"><s:property value="#customer.owner" /></td></tr>';
                          }
                    </s:iterator>
                    innhtml= innhtml+"</tbody>";
                    $('#searchtable').html(innhtml);
                }
        </script>


    </head>

    <body>

        <div class="container">
            <table width="100%" height="114">
                <tr>
                    <td width="116" height="108"><center><img src="images/logo.png"/></center></td>
                    <td width="612" style="padding-left:8px;color:#000079;font-size:20px;font-family:'Lucida Sans Unicode', 'Lucida Grande', sans-serif;">

                        <p>Sigiri Textile Industries (Pvt) Ltd.        </p>
                        <p>No:227/1,
                            Galle Road,Katubedda,
                            Mt.Lavinia,
                            Sri Lanka. </p></td>
                    <td width="458">&nbsp;</td>
                </tr>
            </table>

                <!-- Text Example -->
                <div class="verticalslider" id="textExample">
                    <ul class="verticalslider_tabs">
                        <li style="margin-top:25px;"><a href="#">Customer & Operation</a></li>
                        <li><a href="#">Add Customer</a></li>
                        <li><a href="#">Search Customer</a></li>
                        <li><a href="#">Edit Customer</a></li>
                        <li><a href="#">Customer List</a></li>


                    </ul>
                    <ul class="verticalslider_contents">
                        <li>


                        </li>

                        <li style="padding-left:20px;">

                            <form action="AddCustomer.action" method="post">

                                <fieldset style="height:450px;width:600px;">
                                    <legend>Customer Details</legend>
                                    <div>
                                        <p><label for="input-one" class="float" ><strong>Name:</strong></label>
                                            <input class="inp-text" name="name" id="name" type="text" size="30" /><br/></p>

                                        <P><label for="input-two" class="float"  style="padding-top:10px;"><strong>Address:</strong></label><br />
                                            <textarea rows="1" cols="10"  class="inp-text" id="address"name="address"></textarea> <br/></P>

                                        <p><label for="input-three" class="float"><strong>VAT Number:</strong></label>
                                            <input class="inp-text" name="vatNumber" id="vat" type="text" size="30"/></p>

                                        <p><label for="input-four" class="float"><strong>SVAT Number:</strong></label>
                                            <input class="inp-text" name="svatNumber" id="svat" type="text" size="30"/></p>

                                        <p><label for="input-five" class="float"><strong>TQB Number:</strong></label>
                                            <input class="inp-text" name="tqbNumber" id="tqb" type="text" size="30"/></p>

                                        <p><label for="input-six" class="float"><strong>Telephone:</strong></label>
                                            <input class="inp-text" name="telephone" id="tel" type="text" size="30"/></p>

                                        <p><label for="input-seven" class="float"><strong>Fax:</strong></label>
                                            <input class="inp-text" name="fax" id="fax" type="text" size="30"/></p>

                                        <p><label for="input-eight" class="float"><strong>Owner:</strong></label>
                                            <input class="inp-text" name="owner" id="own" type="text" size="30"/></p>

                                        <p style="padding-left:300px;"><input class="submit-button" type="submit" alt="SUBMIT" name="Submit" value="Submit"/>

                                        </p>
                                    </div>
                                </fieldset>
                            </form>
                        </li>

                        <li style="padding-left:20px;">

                            <form action="#" method="post">

                                <fieldset style="height:500px;width:870px;">
                                    <legend>Customer Search by</legend>
                                   
                                    <P><label for="input-two" class="float"  ><strong>Name:</strong></label><br />
                                        <input class="inp-text" name="input-custName" id="searchname" type="text" size="30"/>
                                        <input type="button" value="Search" onclick="searchByName()"/>

                                    <P><label for="input-two" class="float"  ><strong>Address:</strong></label><br />
                                        <input class="inp-text" name="input-custAddress" id="searchaddress" type="text" size="30"/>
                                        <input type="button" value="Search" onclick="searchByAddress()"/>
                                    <ul>
                                       
                                    </ul>

                                    <div style="height:200px;background-color:#666;width:860px;margin-left:5px;margin-top:10px;">
                                        <table width="860" border="1" style="background-color:#64B1FF;font-family:'Lucida Sans Unicode', 'Lucida Grande', sans-serif;color:#FFF;font-size:14px;font-weight:bold;-webkit-border-radius:5px;" id="searchtable">
                                            
                                        </table>

                                    </div>


                                </fieldset>


                            </form>

                        </li>



                        <li style="padding-left:20px;">

                            <form action="UpdateCustomer.action" >

                                <fieldset style="height:500px;width:600px;">
                                    <legend>Update Customer</legend>
                                    <p><label for="input-one" class="float" ><strong>Select:</strong></label>

                                        <select name="menu" style="width:310px;" onchange="nameSelected()" id="cmbEdit" name="cmbEdit">
                                            <option value="0" selected>Select Customer</option>
                                            <s:iterator value="list" var="customer">
                                                <option value="${customer.id}">${customer.name}</option>
                                            </s:iterator>
                                        </select>
                                    <p><label for="input-zero" class="float" style="padding-top:0px;"><strong>Id:</strong></label><br/>
                                        <input class="inp-text" id="eid" type="text" size="30" disabled="true"/></p>

                                    <input type="hidden" id="ehid" name="id"/>
                                    <p><label for="input-one" class="float" style="padding-top:10px;"><strong>Name:</strong></label><br/>
                                        <input class="inp-text" name="name" id="ename" type="text" size="30"/></p>

                                    <P><label for="input-two" class="float"  style="padding-top:10px;"><strong>Address:</strong></label><br />
                                        <textarea rows="1" cols="10"  class="inp-text" id="eaddress"name="address"></textarea> <br/></P>

                                    <p><label for="input-three" class="float"><strong>VAT Number:</strong></label>
                                        <input class="inp-text" name="vatNumber" id="evat" type="text" size="30"/></p>

                                    <p><label for="input-four" class="float"><strong>SVAT Number:</strong></label>
                                        <input class="inp-text" name="svatNumber" id="esvat" type="text" size="30"/></p>

                                    <p><label for="input-five" class="float"><strong>TQB Number:</strong></label>
                                        <input class="inp-text" name="tqbNumber" id="etqb" type="text" size="30"/></p>

                                    <p><label for="input-six" class="float"><strong>Telephone:</strong></label>
                                        <input class="inp-text" name="telephone" id="etel" type="text" size="30"/></p>

                                    <p><label for="input-seven" class="float"><strong>Fax:</strong></label>
                                        <input class="inp-text" name="fax" id="efax" type="text" size="30"/></p>

                                    <p><label for="input-eight" class="float"><strong>Owner:</strong></label>
                                        <input class="inp-text" name="owner" id="eown" type="text" size="30"/></p>

                                    <p style="padding-left:300px;"><input class="submit-button" type="submit" alt="SUBMIT" name="Submit" value="Update" />

                                    </p>
                                </fieldset>
                            </form>
                        </li>
                        <li style="padding-left:20px;">

                            <form action="#" method="post">

                                <fieldset style="height:500px;width:870px;">
                                    <legend>Customer List</legend>
                                    <div style="height:200px;background-color:#666;width:860px;margin-left:5px;margin-top:10px;">
                                        <table width="860" border="1" style="background-color:#64B1FF;font-family:'Lucida Sans Unicode', 'Lucida Grande', sans-serif;color:#FFF;font-size:14px;font-weight:bold;-webkit-border-radius:5px;">
                                            <thead>
                                            <tr>
                                                <td style="width:100px;height:40px;"><center>Name</center></td>
                                                <td style="width:100px;height:40px;"><center>Address</center></td>
                                                <td style="width:100px;height:40px;"><center>VAT No</center></td>
                                                <td style="width:100px;height:40px;"><center>Telephone</center></td>
                                                <td style="width:100px;height:40px;"><center>Fax</center></td>
                                                <td style="width:100px;height:40px;"><center>Owner</center></td>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <s:iterator value="list" var="customer">
`                                            <tr>
                                                <td style="width:100px;height:40px;"><s:property value="#customer.name" /></td>
                                                <td style="width:100px;height:40px;"><s:property value="#customer.address" /></td>
                                                <td style="width:100px;height:40px;"><s:property value="#customer.vatnumber" /></td>
                                                <td style="width:100px;height:40px;"><s:property value="#customer.telephone" /></td>
                                                <td style="width:100px;height:40px;"><s:property value="#customer.fax" /></td>
                                                <td style="width:100px;height:40px;"><s:property value="#customer.owner" /></td>
                                                

                                            </tr>
                                            </s:iterator>
                                            </tbody>
                                        </table>

                                    </div>
                         </fieldset>
                            </form>
                        </li>


                    </ul>
                    <div style="padding-top:600px;padding-left:290px;">
                        <fieldset style="height:35px;width:600px;">
                            <a href="customer_order.jsp" ><h2>click here to Enter Place order</h2></a>

                        </fieldset>
                    </div>
                </div>




            <table width="100%" height="100" border="1">
                <tr>
                    <td></td>
                </tr>
            </table>


        </div>

    </body>
</html>
