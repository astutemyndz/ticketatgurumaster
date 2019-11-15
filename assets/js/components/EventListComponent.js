function formatDate(date) {
    var monthNames = [
      "Jan", "Feb", "Mar",
      "Apr", "May", "Jun", "Jul",
      "Aug", "Sep", "Oct",
      "Nov", "Dec"
    ];
  
    var day = date.getDate();
    var monthIndex =  parseInt(date.getMonth());
    var year = date.getFullYear();
    console.log(day);
    return day + ' ' + monthNames[monthIndex] + ' ' + year;
  }
  

const EventComponent = function(props) {
    const {event, image} = props;
    const {title, small_description, date, time, duration, slug, date_time, explicitFormatDay, explicitFormatMonth} = event;
    var hours = Math.floor(duration / 60); 
    var min = duration- (hours * 60); 
    const space = ' ';
    //console.log(date);
    var c = new Date(date);
   // console.log(c);
    //const [day,month, year] = formatDate(new Date(date)).split(space);
    return(`
    <div class="col-sm-4">
        <div class="event-inner event-list">
            <a href="${BASE_URL}event/${slug}">
            <div class="card">
                <img src="${BASE_URL}${image}" class="img-fluid" alt="">
                <div class="card-body">
                    <div class="media">
                        <div class="show-date">
                            <h3>${explicitFormatDay}</h3>
                            <p>${explicitFormatMonth}</p>
                        </div>
                        <div class="media-body">
                            <h5 class="mt-0">${title}</h5>
                            <p>Duration: ${hours}:${min}hrs</p>
                            <p>Lal Bahadur Shastri Stadium: Hyderabad</p>
                            <p>Arijit Singh</p>
                        </div>
                    </div>
                </div>
            </div>
            </a>
        </div>
    </div>
    `);
}

function objectToQuerystring (obj) {
    return Object.keys(obj).reduce(function (str, key, i) {
      var delimiter, val;
      delimiter = (i === 0) ? '?' : '&';
      key = encodeURIComponent(key);
      val = encodeURIComponent(obj[key]);
      return [str, delimiter, key, '=', val].join('');
    }, '');
  }
const render = function() {
    const $EventListComponent = $('.EventListComponent');
    let eventArr = [];
    $EventListComponent.loading();
    const url = window.location.href;
    
    // const daterange = urlParams.get('daterange');
    // const location = urlParams.get('location');
    // const filter = urlParams.get('filter');
    // console.log(daterange, location, filter);
    
    
    var urlParams;
    (window.onpopstate = function () {
        var match,
            pl     = /\+/g,  // Regex for replacing addition symbol with a space
            search = /([^&=]+)=?([^&]*)/g,
            decode = function (s) { return decodeURIComponent(s.replace(pl, " ")); },
            query  = window.location.search.substring(1);

        urlParams = {};
        while (match = search.exec(query))
        urlParams[decode(match[1])] = decode(match[2]);
    })();
    if (history.pushState) {
        var newurl = window.location.protocol + "//" + window.location.host + window.location.pathname + objectToQuerystring(urlParams);
        window.history.pushState({path:newurl},'',newurl);
    }
    get(`/events${objectToQuerystring(urlParams)}`).then(function(res) {
        $EventListComponent.loading('stop');
        const events = res.data.events;
        $.each(events, function(index, event) {
            eventArr.push(EventComponent({event: event, image: event.event_img}));
        });
        
        $EventListComponent.html(eventArr.join(''));
    })
}
function onChangeEventHandler(selectedObj, selectedObjType) {
    const selectedValue = selectedObj.value.toLowerCase();
    const selectedType = selectedObjType;
    var urlParams;
    if(selectedType != undefined && selectedType != null && (selectedValue != undefined && selectedValue != null)) {
        //console.log(selectedType + "=" + selectedValue);
        //eventTitle.replace(' ', '-').toLowerCase();
        (window.onpopstate = function () {
            var match,
                pl     = /\+/g,  // Regex for replacing addition symbol with a space
                search = /([^&=]+)=?([^&]*)/g,
                decode = function (s) { return decodeURIComponent(s.replace(pl, " ")); },
                query  = window.location.search.substring(1);
    
            urlParams = {};
            while (match = search.exec(query))
            urlParams[decode(match[1])] = decode(match[2]);
        })();
   
        if (selectedType in urlParams) {
            urlParams = {
                ...urlParams,
                [selectedType]: selectedValue
            }
        }
        if (history.pushState) {
            var newurl = window.location.protocol + "//" + window.location.host + window.location.pathname + objectToQuerystring(urlParams);
            window.history.pushState({path:newurl},'',newurl);
        }
    
        console.log(urlParams);
      
    }
    
    const $EventListComponent = $('.EventListComponent');
    let eventArr = [];
    $EventListComponent.loading();
    // console.log(selectedValue);
    get(`/events${objectToQuerystring(urlParams)}`).then(function(res) {
        $EventListComponent.loading('stop');
        const events = res.data.events;
        $.each(events, function(index, event) {
            eventArr.push(EventComponent({event: event, image: event.event_img}));
        });
        
        $EventListComponent.html(eventArr.join(''));
    })
}
$(document).ready(function () {
    render();
    
});

