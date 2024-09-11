<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add to cart</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
<?php
if (isset($_POST['id'])) {
    $id = $_POST['id'];
    $status = '';

    $xml = new DOMDocument;
    $xml->load('products.xml');

    $xpath = new DOMXPath($xml);
    $dogNodes = $xpath->query("//product[id='$id']");

    foreach ($dogNodes as $dogNode) {
        $dogNode->getElementsByTagName('cart')->item(0)->nodeValue = $status;
    }

    if($xml->save('products.xml')){
        ?>
            <script>
					Swal.fire({
						icon: "success",
						title: "removed to Cart Successfull!",
  						timer: 3000,
						willClose: () => {
							window.location.href = 'shop.php';
						}
					});
				</script>
        <?php
    }
}
?>
</body>
</html>