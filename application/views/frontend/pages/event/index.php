
<?php 
$page = ($this->uri->segment(1)) ? $this->uri->segment(1) : '';

/*
<section class="mt-3 mb-3">
    	<div class="container-fluid">
        	<div class="row">
            	<!-- <div class="col-sm-3">
                	<form>
                	<div class="left-filter">
                    	<h4>Date</h4>
                        <div class="custom-control custom-checkbox">
                          <input type="checkbox" class="custom-control-input" id="filter1">
                          <label class="custom-control-label" for="filter1">Today</label>
                        </div>
                        <div class="custom-control custom-checkbox">
                          <input type="checkbox" class="custom-control-input" id="filter2">
                          <label class="custom-control-label" for="filter2">Tomorrow</label>
                        </div>
                        <div class="custom-control custom-checkbox">
                          <input type="checkbox" class="custom-control-input" id="filter3">
                          <label class="custom-control-label" for="filter3">Weekend</label>
                        </div>
                    </div>
                    <button type="submit" class="btn my-btn filter-btn d-block">Filter</button>
                    </form>
                </div> -->
                <div class="col-sm-12">
                	<div id="" class="row EventListComponent">
                       
                       
                    </div>
                </div>
            </div>
        </div>
    </section>
    */?>

<section class="mt-3  bg-white">
    <div class="container-fluid">
        
        
        
        <div class="row">
            <div class="col-lg-12 mb-3 text-right">
                <div class="">
                    <div class="btn-group list-grid-btn">
                        <a class="btn" id="list">
                            <i class="fas fa-list"></i>
                        </a>
                        <a class="btn" id="grid">
                            <i class="fas fa-th"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div> 
        
    	<div id="products" class="row view-group align-item-center EventListComponent">
           
           
        </div>
    </div>
</section>