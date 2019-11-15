const FilterComponent = function() {
    $('#searchButton').on('click', function(e) {
        e.preventDefault();
        const location = $('#location').val();
        const daterange = $('#daterange').val();
        setQueryString(`search?daterange=${daterange}&location=${location}&filter=1&sort=&category=&distance=`);
        window.location.href = classQueryString;
    
    });
}