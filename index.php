
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script
      src="https://kit.fontawesome.com/64d58efce2.js"
      crossorigin="anonymous"
    ></script>
    <link rel="stylesheet" href="style.css" />
    <title>Smart Grocery</title>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  </head>
  <body>
    <div class="container">
      <div class="forms-container">
        <div class="signin-signup">
          <form method="post" class="sign-in-form">
            <h2 class="title">Sign in</h2>
			<div class="input-field">
              <i class="fas fa-envelope"></i>
              <input type="email" name="email" placeholder="Email" required/>
            </div>
            <div class="input-field">
              <i class="fas fa-lock"></i>
              <input type="password" name="pass" placeholder="Password" required/>
            </div>
            <input type="submit" name="login" value="Login" class="btn solid" />
          </form>
          <form method="post" class="sign-up-form">
            <h2 class="title">Sign up</h2>
            <div class="input-field">
              <i class="fas fa-user"></i>
              <input type="text" name="rname" placeholder="Full name" required/>
            </div>
            <div class="input-field">
              <i class="fas fa-envelope"></i>
              <input type="email" name="remail" placeholder="Email" required/>
            </div>
            <div class="input-field">
              <i class="fas fa-lock"></i>
              <input type="password" name="rpass" placeholder="Password" required/>
            </div>
            <input type="submit" name="register" class="btn" value="Sign up" />
          </form>
        </div>
      </div>

      <div class="panels-container">
        <div class="panel left-panel">
          <div class="content">
            <h3>New here ?</h3>
            <p>
			Register today and explore a world of fresh and affordable groceries.
            </p>
            <button class="btn transparent" id="sign-up-btn">
              Sign up
            </button>
          </div>
          <img src="assets/log.svg" class="image" alt="" />
        </div>
        <div class="panel right-panel">
          <div class="content">
            <h3>One of us ?</h3>
            <p>
			Log in to continue your seamless shopping experience.
            </p>
            <button class="btn transparent" id="sign-in-btn">
              Sign in
            </button>
          </div>
          <img src="assets/register.svg" class="image" alt="" />
        </div>
      </div>
    </div>
	<?php
		session_start();
		if (isset($_SESSION['logged'])) {
			header('Location: shop.php');
			exit;
		}
		if (isset($_POST['login'])) {
			$email = $_POST['email'];
			$password = $_POST['pass'];

			// Load the XML file
			$xml = new DOMDocument();
			$xml->load('users.xml');
			$xpath = new DOMXPath($xml);

			// Find the user
			$users = $xpath->query("/users/user[email='$email']");

			if ($users->length > 0) {
				$storedPassword = $users->item(0)->getElementsByTagName('password')->item(0)->nodeValue;

				// Verify the password
				if (password_verify($password, $storedPassword)) {
					$_SESSION['logged'] = true;
					?>
					<script>
						Swal.fire({
							icon: "success",
							title: "LogIn Successfully!",
  							timer: 3000,
							willClose: () => {
								window.location.href = 'shop.php';
							}
						});
					</script>
					<?php
				} else {
					?>
					<script>
						Swal.fire({
							icon: "error",
							title: "Invalid email or password.",
  							timer: 3000,
							willClose: () => {
								window.location.href = 'index.php';
							}
						});
					</script>
					<?php
				}
			} else {
				?>
					<script>
						Swal.fire({
							icon: "error",
							title: "User not found."
						});
					</script>
				<?php
			}
		}

		if(isset($_POST['register'])){
			$name = $_POST['rname'];
			$email = $_POST['remail'];
			$password = $_POST['rpass'];

			// Hash the password
			$hashedPassword = password_hash($password, PASSWORD_DEFAULT);

			// Load the XML file
			$xml = new DOMDocument();
			$xml->load('users.xml');

			// Create new user element
			$newUser = $xml->createElement("user");
			$newUsername = $xml->createElement("name", $name);
			$newUseremail = $xml->createElement("email", $email);
			$newPassword = $xml->createElement("password", $hashedPassword);

			// Append elements to new user
			$newUser->appendChild($newUsername);
			$newUser->appendChild($newUseremail);
			$newUser->appendChild($newPassword);

			// Append new user to the root element
			$xml->getElementsByTagName('users')->item(0)->appendChild($newUser);

			// Save the XML file
			if($xml->save('users.xml')){
			?>
				<script>
					Swal.fire({
						icon: "success",
						title: "Register Successfully!",
						willClose: () => {
							window.location.href = 'index.php';
						}
					});
				</script>
			<?php
			}else{
			?>
				<script>
					Swal.fire({
						icon: "error",
						title: "Register Failed!",
						willClose: () => {
							window.location.href = 'index.php';
						}
					});
				</script>
			<?php
			}
		}
	?>
    <script src="script.js"></script>
  </body>
</html>
