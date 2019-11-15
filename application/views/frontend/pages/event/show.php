<?php 
$isFoundData = false;
$img = null;
$title = '';
$description = '';
$date = null;
if(!empty($event) && is_array($event)) {
    $isFoundData = true;
    $img = ($event['event_img']) ? base_url().$event['event_img'] : '';
    $title = ($event['title']) ? $event['title'] : '';
    $description = ($event['description']) ? $event['description'] : '';
    $duration = ($event['duration']) ? $event['duration'] : '';
    $date_time = ($event['date_time']) ? $event['date_time'] : date('Y-m-d H:i:s');
    if($date_time) {
        list($date, $time) = explode(" ", $date_time);
    }
    $date = ($date) ? $date : date('Y-m-d');
    $time = ($time) ? $time : now();

    function convertMinToHours($minutes) {
        $hours = floor($minutes / 60);
        $min = $minutes - ($hours * 60);
        echo $hours.":".$min;
    }
}
?>
<!--<section class="mt-3 mb-3">
    	<div class="container-fluid">
        	<div class="event-details-show">
                
<?php if($isFoundData) {?>
    <div class="row">
        <div class="col-sm-5">
            <img src="<?php echo $img;?>" class="img-fluid" alt="">
        </div>
        <div class="col-sm-7">
            <div class="card-body p-0">
                <div class="media align-items-start">
                    <div class="media-body">
                    <div class="show-date event-details-date">
                        <h3><?php echo $date;?></h3>
                    </div>
                    <h5 class="mt-0"><?php echo $title;?></h5>
                    <p><?php echo $small_description;?></p>
                    <a href="#" class="btn my-btn">Book Tickets</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
        	
<?php } else {?> 
    <div class="row">
    <h5 class="mt-0">404 not found</h5>
    </div>
<?php }?>
    </div>
    </div>
</section>-->


<section>
	<div class="container-fluid">
    	<div class="row">
        	<div class="col-12">
            	<div class="event-details-area">
                	<img src="<?php echo $img;?>" class="img-fluid" alt="">
                </div>
                <div class="event-headline">
                	<div class="event-titel-area">
                    	<h2><?php echo $title;?></h2>
                        <p><?php echo convertMinToHours($duration);?>hrs</p>
                    </div>
                    <div class="book-area">
                    	<a href="#" class="btn my-btn">BOOK</a>
                    </div>
                </div>
                <div class="event-address-time">
                	<ul>
                    	<li><?php echo $date;?> &nbsp;at&nbsp;<?php echo $time;?></li>
                        <li><i class="fas fa-map-marker-alt"></i> Lal Bahadur Shastri Stadium: Hyderabad</li>
                        <!-- <li>$ 499 Onwards</li> -->
                    </ul>
                </div>
            </div>
        </div>
        <div class="event-area-details">
            <div class="row">
                <div class="col-sm-3">
                	<div class="artist-view">
                        <h5>Musician</h5>
                        <?php 
                        if($artists) {
                            foreach($artists as $artist) {
                                $artistImage = ($artist['artistImage']) ? base_url().$artist['artistImage'] : '';
                                $artistName = ($artist['artistName']) ? $artist['artistName'] : '';
                                ?>
                        <div class="media align-items-center">
                          <img src="<?php echo $artistImage;?>" alt="">
                          <div class="media-body">
                            <h6 class="mt-0"><?php echo $artistName;?></h6>
                          </div>
                        </div>
                                <?php
                            }
                        }
                        
                        ?>
                        
                    </div>
                </div>
                <div class="col-sm-9">
                	<div class="details-event">
                    	<p class="more">
                        <?php echo $description;?>
                        </p>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>