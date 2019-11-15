
const CartHeading = function(props) {
    return(`
    <div class="cart-heading">
        <h4>Your Tickets</h4>
        <p>Event ticket limit: 19 <a href="#">Full ticket limit info</a></p>
    </div>
    `);
}
const CartFooter = function(props) {
    return(`
    <div class="cart-footer">
        <div class="cart-f-left">
            <h4>3 Seats</h4>
        </div>
        <div class="cart-f-right">
            <a href="#" class="btn my-btn">Next</a>
        </div>
    </div>
    `);
}
const CartComponent = function(props) {
    return(`
    <div class="add-cart-list">
        ${CartHeading()}
        <div class="ticket-cart mCustomScrollbar" data-mcs-theme="minimal">
            <ul>
                
            ${CartItem()}
            </ul>
        </div>
        ${CartFooter()}
    </div>
    `)
}

const CartItem = function(props) {
    return(`
        <li>
            <div class="ticket-top">
                <div class="top-1">
                    <h3>
                        <small>SEC</small>
                        MEZZ
                    </h3>
                </div>
                <div class="top-2">
                    <h3>
                        <small>ROW</small>
                        KK
                    </h3>
                </div>
                <div class="top-3">
                    <h3>
                        <small>SEAT</small>
                        22
                    </h3>
                </div>
            </div>
            <hr />
            <div class="ticket-bottom">
                <div class="bottom-1">
                    <h5>Standard Ticket</h5>
                </div>
                <div class="bottom-2">
                    <h5>$99.50 + Fees</h5>
                </div>
            </div>
            <a href="#" class="cart-delete"><i class="far fa-times-circle"></i></a>
    </li>
    `)
}
$(document).ready(function() {
    // const $cart = $('.cart');
    // $cart.html(CartComponent());
});

