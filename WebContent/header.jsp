<%@page import="sn.isi.entities.Produit"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.google.gson.JsonObject" %>

<%
Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
 
map = new HashMap<Object,Object>(); map.put("label", "Brazil"); map.put("y", 104); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "China"); map.put("y", 153); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "India"); map.put("y", 69); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Japan"); map.put("y", 166); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Korea, Rep"); map.put("y", 146); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Russia"); map.put("y", 61); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "South Africa"); map.put("y", 78); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "United Kingdom"); map.put("y", 135); list.add(map);
 
String dataPoints = gsonObj.toJson(list);
%>

<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="public/public/assets/img/apple-icon.png"/>
    <link rel="icon" type="image/png" href="public/assets/img/favicon.ico"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>Suivi-stock</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
    <!-- CSS Files -->
    <link href="public/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="public/assets/css/light-bootstrap-dashboard.css?v=2.0.0 " rel="stylesheet" />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="public/assets/css/demo.css" rel="stylesheet" />
    
    
    <link href="public/assets2/plugins/toaster/toastr.min.css" rel="stylesheet" />
  <link href="public/assets2/plugins/nprogress/nprogress.css" rel="stylesheet" />
  <link href="public/assets2/plugins/flag-icons/css/flag-icon.min.css" rel="stylesheet"/>
  <link href="public/assets2/plugins/jvectormap/jquery-jvectormap-2.0.3.css" rel="stylesheet" />
  <link href="public/assets2/plugins/ladda/ladda.min.css" rel="stylesheet" />
  <link href="public/assets2/plugins/select2/css/select2.min.css" rel="stylesheet" />
  <link href="public/assets2/plugins/daterangepicker/daterangepicker.css" rel="stylesheet" />

  <!-- SLEEK CSS -->
  <link id="sleek-css" rel="stylesheet" href="public/assets2/css/sleek.css" />
   <script src="public/assets2/plugins/nprogress/nprogress.js"></script>
   
   <script type="text/javascript">

	window.onload = function () {
	var chart = new CanvasJS.Chart("chartContainer", {
		title:{
			text: "My First Chart in CanvasJS"              
		},
		data: [              
		{
			// Change type to "doughnut", "line", "splineArea", etc.
			type: "column",
			dataPoints: [
				<%
					List<Produit> prods = (List<Produit>)request.getAttribute("list_produit");
					for(Produit p:prods) {
						out.print("{ label: '"+p.getDesignation()+"',  y: "+p.getQuantite()+"  },");
					}
				%>
				
				
			]
		}
		]
	});
	chart.render();
// =================================================
	 
	var chart1 = new CanvasJS.Chart("chartContainer1", {
		animationEnabled: true,
		title: {
			text: "Deposit Money Banks' Assets to GDP (percent), 2015"
		},
		axisY: {
			suffix: "%",
			includeZero: true
		},
		axisX: {
			title: "Countries"
		},
		data: [{
			type: "column",
			yValueFormatString: "#,##0\"%\"",
			dataPoints: <%out.print(dataPoints);%>
		}]
	});
	chart1.render();
	 
	}
</script>
</head>

<body>
    <div class="wrapper">
        <div class="sidebar" data-image="public/assets/img/sidebar-5.jpg">
            <!--
        Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"

        Tip 2: you can also add an image using data-image tag
    -->
            <div class="sidebar-wrapper">
                <div class="logo">
                    <a href="http://localhost:8080/JPASuiviStock/Acceuil" class="simple-text">
                        Gestion Stock
                    </a>
                </div>
                <ul class="nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="Acceuil">
                            <i class="nc-icon nc-chart-pie-35"></i>
                            <p>Acceuil</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="User?page=liste">
                            <i class="nc-icon nc-circle-09"></i>
                            <p>Gestion Utilisateur</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="Produit">
                            <i class="nc-icon nc-notes"></i>
                            <p>Gestion Produit</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="Categorie">
                            <i class="nc-icon nc-notes"></i>
                            <p>Gestion Categorie</p>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="main-panel">
            <!-- Navbar -->
            <nav class="navbar navbar-expand-lg " color-on-scroll="500">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#pablo"> Acceuil </a>
                    <div class="collapse navbar-collapse justify-content-end" id="navigation">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="Login">
                                    <span class="no-icon">Connexion</span>
                                </a>
                            </li>
                            
                            <li class="nav-item">
                                <a class="nav-link" href="Logout">
                                    <span class="no-icon">Deconnexion</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>