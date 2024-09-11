<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pruduct</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
<?php
if(isset($_POST['add'])){
    $target_path = "assets/products img/";  
    $imageName = $_FILES['photo']['name'];
    $target_path = $target_path.basename($imageName);   

    if(move_uploaded_file($_FILES['photo']['tmp_name'], $target_path)) {  
        $xml = new DOMDocument();
        $xml -> load("products.xml");

        $newproduct = $xml -> createElement("product");
        $name = $xml -> createElement("name", $_POST['pname']);
        $price = $xml -> createElement("price", $_POST['price']);
        $quantity = $xml -> createElement("quantity", $_POST['quantity']);
        $productPhoto = $xml -> createElement("photo", $imageName);
        $id = uniqid();
        $productid = $xml -> createElement("id", $id);
        $cart = $xml -> createElement("cart", '');

        $newproduct -> appendChild($name);
        $newproduct -> appendChild($price);
        $newproduct -> appendChild($quantity);
        $newproduct -> appendChild($productPhoto);
        $newproduct -> appendChild($productid);
        $newproduct -> appendChild($cart);
        

        // Append new user to the root element
        $xml->getElementsByTagName('products')->item(0)->appendChild($newproduct);
        
        if($xml -> save("products.xml")){
            ?>
                <script>
					Swal.fire({
						icon: "success",
						title: "New Product Successfully Added!",
  						timer: 3000,
						willClose: () => {
							window.location.href = 'shop.php';
						}
					});
				</script>
            <?php
        }else{
            
            ?>
                <script>
					Swal.fire({
						icon: "success",
						title: "New Product Failed Added!",
  						timer: 3000,
						willClose: () => {
							window.location.href = 'shop.php';
						}
					});
				</script>
            <?php
        }
    }
}
?>

</body>
</html>