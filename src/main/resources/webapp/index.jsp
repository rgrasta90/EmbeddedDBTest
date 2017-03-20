<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="resources/js/angular.js"></script>


<link href="resources/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <script src="//code.jquery.com/jquery.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
    <script src="resources/js/myscripts.js"></script>

<style type="text/css">
#book { 
    position: fixed;
    top: 100px;
    right: 5px;
 } 
 
 #details { 
    width: 627px;
 } 
 
 h1 {
	color: graytext;
}
</style>
</head>
<div class="page-header">
   <h1>
   Flights reservations
   </h1>
</div>


<script type="text/javascript">

var app = angular.module( "Demo", [] );

app.controller("testController", function($scope, $http){
	$scope.list = {};
	$scope.details={};
	$scope.flag = false;
	$scope.bookFlag = false;
	
	$scope.init = function (){	

	var promise = $http({
		method:"get",
		url:"SayHello"
		});
	
		promise.then(function(response){
			$scope.list = response.data;
		})
	
	}
	
	$scope.getDetails = function(flight, element){		

		var e = document.getElementsByName("flights");

		var promise = $http({
			method:"get",
			url:"GetDetails",
			params: {flightId: flight.flightId}
			});
		
			promise.then(function(response){

			$scope.details = response.data;
			if($scope.details != ""){
				$scope.flag = true;
			}
			else{
				$scope.flag = false;
				$scope.bookFlag = false;
			}
			})
		
	}
	
	$scope.showBook = function(flight){
	$scope.bookFlag = true;
	
	//document.getElementById("bookFlightId").value=flight.flightDetId;
	$scope.flightId = flight.flightDetId;
	
	document.getElementById("flightCd").value=flight.flightCd;
	document.getElementById("hour").value=flight.departureTime;
	var x = document.getElementById("section");
	var y = x.length;
	if(x.length>0){
		for(var i = 0; i<y; i++){
			x.remove(0);
		}
	}

	if(flight.executive>0){
	var option = document.createElement("option");
	option.text = "Executive class";
	x.add(option); 
	}
	
	if(flight.economic>0){
	var option = document.createElement("option");
	option.text = "Economic class";
	x.add(option); 
	}
	}

	$scope.init();
	
});


</script>
<body>
<div ng-controller="testController" ng-app="Demo"">
<div>
<form action="SayHello" method="GET" style="width: 829px; height: 258px">
<table class="table-striped" border="1">
<tr>
<td></td>
<th>Destination</th>
</tr>
  <tr ng-repeat="x in list">
  	<td><input type="radio" id="x.flightId" value="x.flightId" name="flights" ng-click="getDetails(x, this.checked)"/> </td>
    <td>{{ x.destination }}</td>
  </tr>
</table>
</div>
<div id="details" ng-show="flag">
<br/>
<table border="1" class="table">
	<tr>
		<th></th>
		<th>Flight Number</th>
		<th>Hour</th>
	</tr>
  	<tr ng-repeat="x in details">
  		<td><input type="radio" id="x.flightId" value="x.flightId" name="flightsBook" ng-click="showBook(x)"/></td> 		
    	<td>{{ x.flightCd }}</td>
    	<td>{{ x.departureTime }}</td>
  	</tr>
</table>
</div>
</form>

<div id="book" ng-show=bookFlag>

<form action="">
<input type="hidden" id="flightId"/>
<ul style="list-style-type:none" class ="list-group">
<li>Flight code:<input type="text" id="flightCd" disabled="disabled" maxlength="3" size="5" /></li>
<li>Hour:<input type="text" id="hour" disabled="disabled"/></li>
<li><select id="section" >
</select></li>
<li><a id="bookModal" href="#" class="btn btn-lg btn-success"
   data-toggle="modal"
   data-target="#basicModal">book</a></li>
</ul>
</form>

</div>


<div class="modal fade" id="basicModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
            <h4 class="modal-title" id="myModalLabel">Book Flight</h4>
            </div>
            <div class="modal-body">
            <form id="bookFlight" action="BookFlight" method="POST">
            			  <input type="hidden" name="bookFlightId" id="bookFlightId"/>
               First name:<input type="text" id="firstname"  name="firstname"/>
               Last name: <input type="text" id="lastname"  name="lastname" />
                          <input type="submit" class="btn btn-primary" ng-click="book()" value="Book"/>               
            </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        	</div>	
    </div>
  </div>
</div>
</div>

</body>
</html>