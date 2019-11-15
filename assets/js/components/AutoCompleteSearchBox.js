const AutoCompleteSearchBox = function(callback) {
  let names = [];
  get('/events').then(function(res) {
      const events = res.data.events;
      $.each(events, function(index, event) {
          names.push(event.title);
      });
      return callback(names);
      
  })
 
}



$(document).ready(function () {
AutoCompleteSearchBox(function(res) {
   $.typeahead({
          input: ".js-typeahead",
          minLength: 1,
          maxItem: 15,
          order: "asc",
          hint: true,
         
          maxItemPerGroup: 5,
          backdrop: {
              "background-color": "#fff"
          },
         
          emptyTemplate: 'No result for "{{query}}"',
          source: {
            groupName: {
              // Array of Objects / Strings
              data: res
            },
          },
          callback: {
              onReady: function (node) {
                  this.container.find('.' + this.options.selector.dropdownItem + '.group-ale a').trigger('click')
              },
              onDropdownFilter: function (node, query, filter, result) {
                  console.log(query)
                  console.log(filter)
                  console.log(result)
              },
              onTab: function() {
                // action performed on tab
                // e.g. open the link given by the first object in dropdown
              },
              onClick: function(node, query, filter, result) {
                // action performed when user clicks on a dropdown item
                //console.log(query)
                console.log()
                const eventTitle = filter.display;
               // console.log(result)
                //window.location.href = BASE_URL + 'event/' + eventTitle.replace(' ', '-').toLowerCase();
              }
          },
          debug: true
      });
})
});

