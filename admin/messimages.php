<?php
session_start();
  require '../includes/config.inc.php';

?>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Mess</title>

	<!-- Meta tag Keywords -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="utf-8">
	<meta name="keywords" content="Intrend Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template,
	Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
	<script type="application/x-javascript">
		addEventListener("load", function () {
			setTimeout(hideURLbar, 0);
		}, false);
		function hideURLbar() {
			window.scrollTo(0, 1);
		}
	</script>
	<!--bootsrap -->

	<!--// Meta tag Keywords -->

	<!-- css files -->
    <style>

*{
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

#content{
	width: 50%;
	justify-content: center;
	align-items: center;
	margin: 20px auto;
	border: 1px solid #cbcbcb;
}
form{
	width: 50%;
	margin: 20px auto;
}

#display-image{
	width: 100%;
	justify-content: center;
	padding: 5px;
	margin: 15px;
}
img{
	margin: 5px;
	width: 350px;
	height: 250px;
}




div.gallery {
  margin: 5px;
  border: 1px solid #ccc;
  float: left;
  width: 180px;
}

div.gallery:hover {
  border: 1px solid #777;
}

div.gallery img {
  width: 100%;
  height: auto;
}

div.desc {
  padding: 15px;
  text-align: center;
}
</style>
	<link rel="stylesheet" href="../web_home/css_home/bootstrap.css"> <!-- Bootstrap-Core-CSS -->
	<link rel="stylesheet" href="../web_home/css_home/style.css" type="text/css" media="all" /> <!-- Style-CSS -->
	<link rel="stylesheet" href="../web_home/css_home/fontawesome-all.css"> <!-- Font-Awesome-Icons-CSS -->
	<!-- //css files -->

	<!-- web-fonts -->
	<link href="//fonts.googleapis.com/css?family=Poiret+One&amp;subset=cyrillic,latin-ext" rel="stylesheet">
	<link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese" rel="stylesheet">
	<!-- //web-fonts -->

</head>

<body>

<!-- banner -->
<div class="inner-page-banner" id="home">
	<!--Header-->
	<header>
		<div class="container agile-banner_nav">
			<nav class="navbar navbar-expand-lg navbar-light bg-light">

				<h1><a class="navbar-brand" href="admin_home.php">RIT <span class="display"> </span></a></h1>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse justify-content-center" id="navbarSupportedContent">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item active">
							<a class="nav-link" href="admin_home.php">Home <span class="sr-only">(current)</span></a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="create_hostel.php">Add New Hostel</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="create_hm.php">Appoint Hostel Manager</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="create_mess.php">Add New Mess</a>
						</li>
						<li class="nav-item">
						<a class="nav-link" href="hostels.php">Hostels</a>
					</li>
                    <li class="nav-item">
						<a class="nav-link" href="Mess.php">Mess</a>
					</li>
						<li class="nav-item">
							<a class="nav-link" href="students.php">Students</a>
						</li>
                        <li class="dropdown nav-item">
								<li>
									<a href="../includes/logout.inc.php" class="nav-link">Logout</a>
								</li>
							</ul>
						</li>
					

					</ul>
				</div>
			</nav>
		</div>
	</header>
	<!--Header-->
</div>
<!-- //banner -->
<br><br><br>



<div id="content">
		<form method="POST" action="" enctype="multipart/form-data">
			<div class="form-group">
				<input class="form-control" type="file" name="uploadfile" value="" />
			</div>
			<div class="form-group">
				<button class="btn btn-primary" type="submit" name="upload">UPLOAD</button>
			</div>
		</form>
	</div>


<div id="display-image">

   






<?php
if (isset($_GET['id'])) {
    $hi = $_GET['id'];
    echo $hi;
    $query = " select * from messimage where mess_id= " . $hi;
    $result = mysqli_query($conn, $query);
    $i = 0;
    $j = 1;
    while ($data = mysqli_fetch_assoc($result)) {
        //get the room_no of the student from room_id in room table



        if ($i % 4 == 0) {
            echo '<br><br>';
            echo '<div class="banner-bottom">
        <div class="container-fluid">
            <div class="banner_bottom_agile_grids">
                <div class="row wthree_banner_bottom_right_grids pr-sm-3">';
        }

        if ($j == 1) {
            echo '<div class="col-lg-3 col-sm-6 banner_bottom_right_grid">
                    <img src="./image/' . $data["filename"] . '">
            </div>';
            $j = $j + 1;
            $i = $i + 1;
        } else if ($j == 2) {
            echo '<div class="col-lg-3 col-sm-6 mt-sm-0 mt-3 banner_bottom_right_grid">
                    <img src="./image/' . $data["filename"] . '">
        </div>';
            $j = $j + 1;
            $i = $i + 1;
        } else if ($j == 3) {
            echo '<div class="col-lg-3 col-sm-6 mt-lg-0 mt-3 banner_bottom_right_grid">
                    <img src="./image/' . $data["filename"] . '">
        </div>';
            $j = $j + 1;
            $i = $i + 1;
        } else if ($j == 4) {

            echo '<div class="col-lg-3 col-sm-6 mt-lg-0 mt-3 banner_bottom_right_grid">
                    <img src="./image/' . $data["filename"] . '">
        </div>';
            $j = 1;
            $i = $i + 1;


        }




        if ($i % 4 == 0) {
            echo '<br><br>';
            echo '	</div>
                    <div class="clearfix"> </div>
                   </div>
                   </div>
                   </div>';
        }






        //   echo "<tr><td>{$hostel_name}</td><td>{$row1['Hostel_id']}</td><td>{$crooms}</td><td>{$arooms}</td><td>{$students}</td></tr>\n";
    }
}
	?>



	<?php
		// }
	?>
	</div>




<!--footer-->
<footer class="py-5">
	<div class="container py-md-5">
		<div class="footer-logo mb-5 text-center">
			<a class="navbar-brand" href="http://nitk.ac.in" target="_blank">RIT <span class="display"> Surathkal</span></a>
		</div>
		<div class="footer-grid">

			<div class="list-footer">
				<ul class="footer-nav text-center">
					<li>
						<a href="home.php">Home</a>
					</li>

					<li>
						<a href="services.php">Hostels</a>
					</li>
					<li>
						<a href="profile.php">Profile</a>
					</li>
				</ul>
			</div>

		</div>
	</div>
</footer>
<!-- footer -->

<!-- js-scripts -->

	<!-- js -->
	<script type="text/javascript" src="web_home/js/jquery-2.2.3.min.js"></script>
	<script type="text/javascript" src="web_home/js/bootstrap.js"></script> <!-- Necessary-JavaScript-File-For-Bootstrap -->
	<!-- //js -->

	<!-- stats -->
	<script src="web_home/js/jquery.waypoints.min.js"></script>
	<script src="web_home/js/jquery.countup.js"></script>
	<script>
		$('.counter').countUp();
	</script>
	<!-- //stats -->

	<!-- start-smoth-scrolling -->
	<script src="web_home/js/SmoothScroll.min.js"></script>
	<script type="text/javascript" src="web_home/js/move-top.js"></script>
	<script type="text/javascript" src="web_home/js/easing.js"></script>
	<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event){
				event.preventDefault();
				$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
			});
		});
	</script>
	<!-- here stars scrolling icon -->
	<script type="text/javascript">
		$(document).ready(function() {
			/*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear'
				};
			*/

			$().UItoTop({ easingType: 'easeOutQuart' });

			});
	</script>
	<!-- //here ends scrolling icon -->
	<!-- start-smoth-scrolling -->

<!-- //js-scripts -->

</body>
</html>

<?php

   if(isset($_POST['submit'])){
     $roll = $_SESSION['roll'];
     $password = $_POST['pwd'];
     $hostel = $_GET['id'];
     $message = "Allocate a Room";


     $query_imp = "SELECT * FROM Student WHERE Student_id = '$roll'";
     $result_imp = mysqli_query($conn,$query_imp);
     $row_imp = mysqli_fetch_assoc($result_imp);
     $room_id = $row_imp['Room_id'];

     if(is_null($room_id)){

     $query_imp2 = "SELECT * FROM Application WHERE Student_id = '$roll'";
     $result_imp2 = mysqli_query($conn,$query_imp2);
     if(mysqli_num_rows($result_imp2)==0){


     $query = "SELECT * FROM Student WHERE Student_id = '$roll'";
     $result = mysqli_query($conn,$query);
     if($row = mysqli_fetch_assoc($result)){
     	$pwdCheck = password_verify($password, $row['Pwd']);

        if($pwdCheck == false){
            echo "<script type='text/javascript'>alert('Incorrect Password!!')</script>";
      }
      else if($pwdCheck == true) {


      	$query_imp = "SELECT * FROM Payment WHERE Student_id = '$roll'";
   		$result_imp = mysqli_query($conn,$query_imp);
    	$row_imp = mysqli_fetch_assoc($result_imp);
    	$status = $row_imp['Status'];

   		if(1){

      	    $query2 = "SELECT * FROM Hostel WHERE Hostel_name = '$hostel'";
      	    $result2 = mysqli_query($conn,$query2);
      	    $row2 = mysqli_fetch_assoc($result2);
      	    $hostel_id = $row2['Hostel_id'];
            $query3 = "INSERT INTO Application (Student_id,Hostel_id,Application_status,Message) VALUES ('$roll','$hostel_id',true,'$message')";
            $result3 = mysqli_query($conn,$query3);

            if($result3){
            
							if ($status == 1) {
								echo "<script type='text/javascript'>alert('Application Sent successfully')</script>";
							}else{
								echo "<script type='text/javascript'>alert('Application Sent successfully now Please pay your fees')</script>";

								sleep(3);
								echo"<script>window.location='payment_form.php'</script>";
							}
            }
        }
        else{
        	echo "<script type='text/javascript'>alert('Please Pay Fees')</script>";
        }
      }
     }

     }
     else{
     	echo "<script type='text/javascript'>alert('You have already applied for a room')</script>";
     }

     }
     else{
          echo "<script type='text/javascript'>alert('You have Already been alloted a Room')</script>";
      }


}
?>

<?php
error_reporting(0);

$msg = "";

// If upload button is clicked ...
if (isset($_POST['upload'])) {

	$filename = $_FILES["uploadfile"]["name"];
	$tempname = $_FILES["uploadfile"]["tmp_name"];
	$folder = "image/" . $filename;



	// Get all the submitted data from the form
    $hi = $_GET['id'];
	$sql = "INSERT INTO messimage (filename,mess_id) VALUES ('$filename',$hi)";

	// Execute query
	mysqli_query($conn, $sql);

	// Now let's move the uploaded image into the folder: image
	if (move_uploaded_file($tempname, $folder)) {
		echo "<h3> Image uploaded successfully!</h3>";
        echo"<script>window.location='./messimages.php?id='. $hi</script>";
	} else {
		echo "<h3> Failed to upload image!</h3>";
	}
}
?>

