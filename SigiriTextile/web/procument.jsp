<%-- 
    Document   : procument
    Created on : Feb 26, 2012, 11:05:12 AM
    Author     : Pancha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s" %>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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

                var suppId=$('#cmbEdit').val();
            <s:iterator value="list" var="supplier">

                    if(${supplier.id}==suppId){
                        $("#eid").val('${supplier.id}');
                        $("#ehid").val('${supplier.id}');
                        $("#ename").val('${supplier.name}');
                        $("#eaddress").val('${supplier.address}');
                        $("#evat").val('${supplier.vatnumber}');
                        $("#esvat").val('${supplier.svatnumber}');
                        $("#etel").val('${supplier.telephone}');
                        $("#efax").val('${supplier.fax}');
                        $("#econtact").val('${supplier.contactPerson}');
                        $("#eemail").val('${supplier.email}');
                    }

            </s:iterator>
                }

                function searchByName(){
                    var name = $("#searchname").val();
                    var innhtml='<thead><tr><td style="width:100px;height:40px;"><center>Name</center></td><td style="width:100px;height:40px;"><center>Address</center></td><td style="width:100px;height:40px;"><center>VAT No</center></td><td style="width:100px;height:40px;"><center>Telephone</center></td><td style="width:100px;height:40px;"><center>Fax</center></td><td style="width:100px;height:40px;"><center>Email</center></td></tr></thead><tbody>';
            <s:iterator value="list" var="supplier">
                    if('${supplier.name}'.search(new RegExp(name,"i"))>=0){

                        innhtml=innhtml+'<tr><td style="width:100px;height:40px;"><s:property value="#supplier.name" /></td><td style="width:100px;height:40px;"><s:property value="#supplier.address" /></td><td style="width:100px;height:40px;"><s:property value="#supplier.vatnumber" /></td><td style="width:100px;height:40px;"><s:property value="#supplier.telephone" /></td><td style="width:100px;height:40px;"><s:property value="#supplier.fax" /></td><td style="width:100px;height:40px;"><s:property value="#supplier.email" /></td></tr>';
                    }
            </s:iterator>
                    innhtml= innhtml+"</tbody>";
                    $('#searchtable').html(innhtml);
                }
                function searchByAddress(){
                    var address = $("#searchaddress").val();
                    var innhtml='<thead><tr><td style="width:100px;height:40px;"><center>Name</center></td><td style="width:100px;height:40px;"><center>Address</center></td><td style="width:100px;height:40px;"><center>VAT No</center></td><td style="width:100px;height:40px;"><center>Telephone</center></td><td style="width:100px;height:40px;"><center>Fax</center></td><td style="width:100px;height:40px;"><center>Email</center></td></tr></thead><tbody>';
            <s:iterator value="list" var="supplier">
                    if('${supplier.address}'.search(new RegExp(address,"i"))>=0){

                        innhtml=innhtml+'<tr><td style="width:100px;height:40px;"><s:property value="#supplier.name" /></td><td style="width:100px;height:40px;"><s:property value="#supplier.address" /></td><td style="width:100px;height:40px;"><s:property value="#supplier.vatnumber" /></td><td style="width:100px;height:40px;"><s:property value="#supplier.telephone" /></td><td style="width:100px;height:40px;"><s:property value="#supplier.fax" /></td><td style="width:100px;height:40px;"><s:property value="#supplier.email" /></td></tr>';
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
                    <td width="608" style="padding-left:8px;color:#000079;font-size:22px;">

                        <p>Sigiri Textile Industries (Pvt) Ltd.</p>
                        <p>No:227/1,
                            Galle Road,Katubedda,
                            Mt.Lavinia,
                            Sri Lanka. </p></td>
                    <td width="458">&nbsp;</td>
                </tr>
            </table>
            <table width="100%" >
                <tr>
                    <td width="197">&nbsp;</td>


                </tr>
            </table>

            <div class="verticalslider" id="textExample">
                <ul class="verticalslider_tabs">
                    <li style="margin-top:25px;"><a href="#">Procurement</a></li>
                    <li><a href="#">Add Supplier</a></li>
                    <li><a href="#">Search Supplier</a></li>
                    <li><a href="#">Edit Supplier</a></li>
                    <li><a href="#">Supplier List</a></li>


                </ul>
                <ul class="verticalslider_contents">
                    <li>
                        <div style="padding-top:150px;padding-left:150px;">
                            <fieldset style="height:45px;width:200px;">
                                <center>	
                                    <a href="ItemConfiguration.action" ><h2>Item Configuration</h2></a></center>
                            </fieldset>
                        </div>
                        <div style="margin-top:-130px;padding-left:400px;">
                            <fieldset style="height:45px;width:200px;">
                                <center>
                                    <a href="SupplierOrder.action" ><h2>Place Supplier Order</h2></a></center>
                            </fieldset>
                        </div>
                    </li>

                    <li style="padding-left:10px;">

                        <form action="AddSupplier.action" method="post">

                            <fieldset style="height:450px;width:600px;">
                                <legend>Supplier Details</legend>
                                <div>
                                    <p><label for="input-one" class="float" ><strong>Name:</strong></label>
                                        <input class="inp-text" name="supplier.name" id="name" type="text" size="30" /><br/></p>

                                    <P><label for="input-two" class="float"  style="padding-top:10px;"><strong>Address:</strong></label><br />
                                        <textarea rows="1" cols="10"  class="inp-text" id="address"name="supplier.address"></textarea> <br/></P>

                                    <p><label for="input-three" class="float"><strong>VAT Number:</strong></label>
                                        <input class="inp-text" name="supplier.vatnumber" id="vat" type="text" size="30"/></p>

                                    <p><label for="input-three" class="float"><strong>SVAT Number:</strong></label>
                                        <input class="inp-text" name="supplier.svatnumber" id="svat" type="text" size="30"/></p>

                                    <p><label for="input-four" class="float"><strong>Fax:</strong></label>
                                        <input class="inp-text" name="supplier.fax" id="fax" type="text" size="30"/></p>

                                    <p><label for="input-five" class="float"><strong>Contact Person:</strong></label>
                                        <input class="inp-text" name="supplier.contactPerson" id="contact" type="text" size="30"/></p>

                                    <p><label for="input-six" class="float"><strong>Telephone:</strong></label>
                                        <input class="inp-text" name="supplier.telephone" id="tel" type="text" size="30"/></p>

                                    <p><label for="input-seven" class="float"><strong>E-mail:</strong></label>
                                        <input class="inp-text" name="supplier.email" id="email" type="text" size="30"/></p>



                                    <p style="padding-left:300px;"><input class="reset-button" type="reset" alt="RESET" name="reset" value="Reset"/>
                                        <input class="submit-button" type="submit" alt="SUBMIT" name="Submit" value="Submit"/>

                                    </p>
                                </div>
                            </fieldset>


                        </form>
                    </li>

                    <li style="padding-left:10px;">

                        <form action="#" method="post">

                            <fieldset style="height:500px;width:870px;">
                                <legend>Supplier by</legend>


                                <P><label for="input-two" class="float" ><strong>Name:</strong></label><br />
                                    <input class="inp-text" name="input-tqb" type="text" size="30" id="searchname"/>
                                    <input type="button" value="Search" onclick="searchByName()"/>

                                <P><label for="input-two" class="float" ><strong>Address:</strong></label><br />
                                    <input class="inp-text" name="input-tqb" type="text" size="30" id="searchaddress"/>
                                    <input type="button" value="Search" onclick="searchByAddress()"/>
                                <ul>
                                    <div style="padding-left:560px;">

                                    </div>
                                </ul>

                                <div style="height:200px;background-color:#666;width:860px;margin-left:5px;margin-top:10px;">
                                    <table width="860" border="1" style="background-color:#64B1FF;font-family:'Lucida Sans Unicode', 'Lucida Grande', sans-serif;color:#FFF;font-size:14px;font-weight:bold;-webkit-border-radius:5px;" id="searchtable">

                                    </table>
                                </div>


                            </fieldset>


                        </form>

                    </li>
                    <li style="padding-left:10px;">

                        <form action="UpdateSupplier.action" >

                            <fieldset style="height:500px;width:600px;margin-top:10px;">
                                <legend>Edit Supplier</legend>



                                <p><label for="input-select" class="float" ><strong>Select:</strong></label>

                                    <select name="menu" style="width:310px;" onchange="nameSelected()" id="cmbEdit">
                                        <option value="0" selected>Select Supplier</option>
                                        <s:iterator value="list" var="supplier">
                                            <option value="${supplier.id}">${supplier.name}</option>
                                        </s:iterator>
                                    </select>



                                <p><label for="input-zero" class="float"><strong>Id:</strong></label><br/>
                                    <input class="inp-text" id="eid" type="text" size="30"/><br/></p>

                                <input type="hidden" id="ehid" name="supplier.id"/>
                                <p><label for="input-one" class="float"><strong>Name:</strong></label><br/>
                                    <input class="inp-text" name="supplier.name" id="ename" type="text" size="30"/><br/></p>

                                <P><label for="input-two" class="float"  style="padding-top:10px;"><strong>Address:</strong></label><br />
                                    <textarea rows="1" cols="10"  class="inp-address" id="eaddress" name="supplier.address"></textarea> <br/></P>

                                <p><label for="input-three" class="float"><strong>VAT No:</strong></label>
                                    <input class="inp-text" name="supplier.vatnumber" id="evat" type="text" size="30"/></p>

                                <p><label for="input-three" class="float"><strong>SVAT No:</strong></label>
                                    <input class="inp-text" name="supplier.svatnumber" id="esvat" type="text" size="30"/></p>

                                <p><label for="input-four" class="float"><strong>Fax:</strong></label>
                                    <input class="inp-text" name="supplier.fax" id="efax" type="text" size="30"/></p>

                                <p><label for="input-five" class="float"><strong>Contact Person:</strong></label>
                                    <input class="inp-text" name="supplier.contactPerson" id="econtact" type="text" size="30"/></p>

                                <p><label for="input-six" class="float"><strong>Telephone:</strong></label>
                                    <input class="inp-text" name="supplier.telephone" id="etel" type="text" size="30"/></p>

                                <p><label for="input-eight" class="float"><strong>E-mail:</strong></label>
                                    <input class="inp-text" name="supplier.email" id="eemail" type="text" size="30"/></p>

                                <p style="padding-left:300px;"><input class="reset-button" type="reset" alt="RESET" name="reset" value="Reset"/>
                                    <input class="submit-button" type="submit" alt="SUBMIT" name="Submit" value="Update"/>

                                </p>

                            </fieldset>


                        </form>
                    </li>
                    <li style="padding-left:10px;">

                        <form action="" >

                            <fieldset style="height:500px;width:870px;margin-top:10px;">
                                <legend>Suppliers</legend>
                                <div style="height:200px;background-color:#666;width:860px;margin-left:5px;margin-top:10px;">
                                    <table width="860" border="1" style="background-color:#64B1FF;font-family:'Lucida Sans Unicode', 'Lucida Grande', sans-serif;color:#FFF;font-size:14px;font-weight:bold;-webkit-border-radius:5px;">
                                        <tr>
                                            <td style="width:100px;height:40px;"><center>Name</center></td>
                                            <td style="width:100px;height:40px;"><center>Address</center></td>
                                            <td style="width:100px;height:40px;"><center>Tel</center></td>
                                            <td style="width:100px;height:40px;"><center>Fax</center></td>
                                            <td style="width:100px;height:40px;"><center>VAT No</center></td>
                                            <td style="width:100px;height:40px;"><center>E-mail</center></td>

                                        </tr>
                                        <s:iterator value="list" var="supplier">
                                            <tr>

                                                <td style="width:100px;height:40px;"><s:property value="#supplier.name"/></td>
                                                <td style="width:100px;height:40px;"><s:property value="#supplier.address"/></td>
                                                <td style="width:100px;height:40px;"><s:property value="#supplier.telephone"/></td>
                                                <td style="width:100px;height:40px;"><s:property value="#supplier.fax"/></td>
                                                <td style="width:100px;height:40px;"><s:property value="#supplier.vatnumber"/></td>
                                                <td style="width:100px;height:40px;"><s:property value="#supplier.email"/></td>

                                            </tr>
                                        </s:iterator>
                                    </table>


                                </div>
                            </fieldset>

                        </form>
                    </li>
                </ul>
            </div>

            <table width="100%" height="100" border="1">
                <tr>
                    <td></td>
                </tr>
            </table>


        </div>

    </body>
</html>
