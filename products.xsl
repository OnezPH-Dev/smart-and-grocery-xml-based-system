<!-- templates/dogs.xsl -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    <xsl:template match="products">
        <html>
            <head>
                <title>Smart Grocery</title>
                <link rel="stylesheet" type="text/css" href="shop.css"/>
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
                
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/izitoast/dist/css/iziToast.min.css"/>
                <script src="https://cdn.jsdelivr.net/npm/izitoast/dist/js/iziToast.min.js"></script>

                <link rel="stylesheet"
                href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css"/>
                <!-- or -->
                <link rel="stylesheet"
                href="https://unpkg.com/boxicons@latest/css/boxicons.min.css"/>
                <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
                <script>
                function validateForm() {
                    var photo = document.getElementById('photo');
                    var pname = document.getElementById('pname');
                    var price = document.getElementById('price');
                    var quantity = document.getElementById('quantity');
                    if (photo.value === '' || pname.value === '' || price.value === '' || quantity.value === '') {
                    iziToast.show({
                        backgroundColor: '#5995fd',
                        messageColor: '#ffffff',
                        message: 'Please fill out the product details.',
                        position: 'topRight'
                    });
                    return false;
                    }
                    return true;
                }
                </script>
            </head>
            <body>
                <!-- Modal -->
                <div class="modal fade" id="adddog" tabindex="-1" aria-labelledby="adddog" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="adddogLabel">Add new product</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form onsubmit="return validateForm()" id="addcase-form" action="addProduct.php" method="post" enctype="multipart/form-data">
                        <div class="modal-body">
                            <div class="form-group mb-3">
                                <label for="photo" class="form-label">Product Photo</label>
                                <input class="form-control" name="photo" type="file" id="photo" accept="image/*"/>
                            </div>
                            <div class="form-group mb-3">
                                <label for="pname">Product Name</label>
                                <input type="text" id="pname" class="form-control" name="pname" />
                            </div>
                            <div class="form-group mb-3">
                                <label for="price">Price</label>
                                <input type="text" id="price" class="form-control" name="price" />
                            </div>
                            <div class="form-group mb-3">
                                <label for="quantity">Quantity</label>
                                <input type="text" id="quantity" class="form-control" name="quantity"/>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" name="add" class="addbtn">Save</button>
                        </div>
                    </form>
                    </div>
                </div>
                </div>
                <div class="modal fade" id="foundeddogs" tabindex="-1" aria-labelledby="foundeddogs" aria-hidden="true">
                <div class="modal-dialog modal-dialog-scrollable modal-lg">
                    <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="foundeddogsLabel">Cart</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                        <div class="modal-body">
                            <table class="table">
                                <thead class="table-light">
                                    <tr>
                                        <th scope="col">Name</th>
                                        <th scope="col">Quantity</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <xsl:for-each select="product[cart='added']">
                                        <tr>
                                            <td scope="col"><xsl:value-of select="name"/></td>
                                            <td scope="col"><xsl:value-of select="quantity"/></td>
                                            <td scope="col"><xsl:value-of select="price"/></td>
                                            <td scope="col">
                                            <form action="removetocart.php" method="post">
                                                <input type="hidden" name="id" value="{id}"/>
                                                <button class="delete" type="submit"><i class='bx bxs-trash'></i></button>
                                            </form>
                                            </td>
                                        </tr>
                                    </xsl:for-each>
                                </tbody>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                </div>
                <div class="header shadow">
                    <h1 id="headertitle">Smart Grocery</h1>
                    <div class="hmenu">
                        <button type="button" data-bs-toggle="modal" data-bs-target="#foundeddogs"><i class='bx bxs-cart-alt'></i></button>
                        |<button type="button" onclick="logout()" style="font-size: 20px;">Log Out</button>
                    </div>
                </div>
                <section id="hero">
                    <div class="slider">
                        <div class="list">
                            <div class="item">
                                <img src="assets/slider img/banner.png" alt="" />
                            </div>
                            <div class="item">
                                <img src="assets/slider img/banner 1.png" alt="" />
                            </div>
                            <div class="item">
                                <img src="assets/slider img/banner 2.png" alt="" />
                            </div>
                            <div class="item">
                                <img src="assets/slider img/banner 3.png" alt="" />
                            </div>
                        </div>

                        <!-- button prev and next -->
                        <div class="slider-nav">
                            <button id="prev">&lt;</button>
                            <button id="next">&gt;</button>
                        </div>

                        <!-- dots (if 4 items => 4 dots )-->
                        <ul class="dots">
                            <li class="active"></li>
                            <li></li>
                            <li></li>
                            <li></li>
                        </ul>
                    </div>
                </section>
                <div class="headermain-text">
                    <h3>Exclusive Offer</h3>
                    <div class="hbtncon">
                        <button type="button" data-bs-toggle="modal" data-bs-target="#adddog">Add new product</button>
                    </div>
                </div>
                <div class="main-con">
                   <xsl:for-each select="product">
                        <div class="card" style="background-collor: #fff; padding: 20px"> 
                            <div class="productimgcon">
                                <img src="assets/products img/{photo}" alt="Card Image"/>
                            </div>
                            <div class="card-body">
                                <h5 class="card-title">Name: <xsl:value-of select="name"/></h5>
                                <p class="card-text" style="color: #676767; font-size: 14px">
                                    Quantity: <xsl:value-of select="quantity"/>
                                </p>
                                <div class="btnact">
                                    <h4>Price: <xsl:value-of select="price"/></h4>
                                    <div class="btnac">
                                        <form action="delete.php" method="post">
                                            <input type="hidden" name="id" value="{id}"/>
                                            <button class="delete" type="submit"><i class='bx bxs-trash'></i></button>
                                        </form>
                                        <form action="addcart.php" method="post">
                                            <input type="hidden" name="id" value="{id}"/>
                                            <button class="founded" type="submit"><i class='bx bxs-cart-alt'></i></button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </xsl:for-each>
                </div>
                <script src="shop.js"></script>
                <script>
                    function logout(){
                        Swal.fire({
                            title: "Logout Confirmation",
                            text: "Are you sure you want to log out?",
                            icon: "warning",
                            showCancelButton: true,
                            confirmButtonColor: "#3085d6",
                            cancelButtonColor: "#d33",
                            confirmButtonText: "Yes, Log Out"
                            }).then((result) => {
                            if (result.isConfirmed) {
                                window.location.href = 'logout.php';
                            }
                        });
                    }
                </script>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
