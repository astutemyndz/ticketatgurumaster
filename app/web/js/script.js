window.onload = function () {

    let txtRow = document.querySelector('#txtRow');
    let txtColumn = document.querySelector('#txtColumn');
    let btnApply = document.querySelector('#btnApply');
    let divRoom = document.querySelector('.room');
    let ulContextMenu = document.querySelector('ul.context-menu');
    let chkFillWithTable = document.querySelector('#chkFillWithTable');
    let txtSeatCapacity = document.querySelector('#txtSeatCapacity');
    let ddlSeatType = document.querySelector('#ddlSeatType');

    let divControlPanel = document.querySelector('div.ctrl-panel');

    let lisContextMenu = ulContextMenu.querySelectorAll('li');
    let liInsertRowBefore = lisContextMenu.item(0);
    let liInsertRowAfter = lisContextMenu.item(1);
    let liInsertColumnToLeft = lisContextMenu.item(2);
    let liInsertColumnToRight = lisContextMenu.item(3);
    let liDeleteRow = lisContextMenu.item(4);
    let liDeleteColumn = lisContextMenu.item(5);
    let liAddOrDeleteTable = lisContextMenu.item(6);

    let ulSeatMenu = document.querySelector('ul.seat-menu');
    let lisSeatMenu = ulSeatMenu.querySelectorAll('li');
    let liMarkAsFree = lisSeatMenu.item(1);
    let liMarkAsRed = lisSeatMenu.item(2);
    let liMarkAsGold = lisSeatMenu.item(3);
    let liMarkAsBlocked = lisSeatMenu.item(4);

    let ulTableMenu = document.querySelector('ul.table-menu');
    let lisTableMenu = ulTableMenu.querySelectorAll('li');
    let liExtendCapacity = lisTableMenu.item(0);
    let liMarkAllAsFree = lisTableMenu.item(1);
    let liMarkAllAsRed = lisTableMenu.item(2);
    let liMarkAllAsGold = lisTableMenu.item(3);
    let liMarkAllAsBlocked = lisTableMenu.item(4);

    let btnZoomIn = document.querySelector('#btnZoomIn');
    let btnZoomOut = document.querySelector('#btnZoomOut');

    let btnMoveUp = document.querySelector('#btnMoveUp');
    let btnMoveDown = document.querySelector('#btnMoveDown');
    let btnMoveLeft = document.querySelector('#btnMoveLeft');
    let btnMoveRight = document.querySelector('#btnMoveRight');

    let btnReset = document.querySelector('#btnReset');
    let btnShowHide = document.querySelector('#btnShowHide');
    let btnPreview = document.querySelector('#btnPreview');

    let scaleFactor = 1;
    let translationAlongX = 0;
    let translationAlongY = 0;

    let noOfRows, noOfColumns;

    document.body.onclick = function () {
        $([ulContextMenu, ulSeatMenu, ulTableMenu]).hide();
    };

    btnPreview.onclick = function () {

        let cells = document.querySelectorAll('.cell');
        let rows = document.querySelectorAll('.row');

        if (this.innerText == 'Preview') {
            this.innerText = 'Test Mode';
            [...cells, ...rows].forEach(e => e.style.border = 0);
        }
        else {
            this.innerText = 'Preview';
            [...cells, ...rows].forEach(e => e.style.removeProperty('border'));
        }


    };

    btnShowHide.onclick = function () {
        $(divControlPanel).toggle();
    };

    btnReset.onclick = function () {
        scaleFactor = 1;
        translationAlongX = 0;
        translationAlongY = 0;
        divRoom.style.transform = `matrix(${scaleFactor}, 0, 0, ${scaleFactor}, ${translationAlongX}, ${translationAlongY})`;
    };

    btnZoomIn.onclick = function () {
        scaleFactor += 0.1;
        divRoom.style.transform = `matrix(${scaleFactor}, 0, 0, ${scaleFactor}, ${translationAlongX}, ${translationAlongY})`;
    };

    btnZoomOut.onclick = function () {
        scaleFactor -= 0.1;
        divRoom.style.transform = `matrix(${scaleFactor}, 0, 0, ${scaleFactor}, ${translationAlongX}, ${translationAlongY})`;
    };

    btnMoveUp.onclick = function () {
        translationAlongY -= 10;
        divRoom.style.transform = `matrix(${scaleFactor}, 0, 0, ${scaleFactor}, ${translationAlongX}, ${translationAlongY})`;
    };

    btnMoveDown.onclick = function () {
        translationAlongY += 10;
        divRoom.style.transform = `matrix(${scaleFactor}, 0, 0, ${scaleFactor}, ${translationAlongX}, ${translationAlongY})`;
    };

    btnMoveLeft.onclick = function () {
        translationAlongX -= 10;
        divRoom.style.transform = `matrix(${scaleFactor}, 0, 0, ${scaleFactor}, ${translationAlongX}, ${translationAlongY})`;
    };

    btnMoveRight.onclick = function () {
        translationAlongX += 10;
        divRoom.style.transform = `matrix(${scaleFactor}, 0, 0, ${scaleFactor}, ${translationAlongX}, ${translationAlongY})`;
    };

    chkFillWithTable.onclick = function () {

        if (this.checked) {
            txtSeatCapacity.readOnly = false;
            ddlSeatType.disabled = false;
        }
        else {
            txtSeatCapacity.readOnly = true;
            ddlSeatType.disabled = true;
        }

    };

    btnApply.onclick = function () {

        noOfRows = +txtRow.value;
        noOfColumns = +txtColumn.value;

        divRoom.innerHTML = '';

        for (let i = 1; i <= noOfRows; i++) {
            let $divRow = $(`<div class='row'></div>`);
            populateRowWithCells($divRow);
            $(divRoom).append($divRow);
        }

        if (chkFillWithTable.checked) {

            let capacity = txtSeatCapacity.value;
            let type = ddlSeatType.value;
            let rows = divRoom.querySelectorAll('.row');

            for (let r of rows) {
                let cells = r.querySelectorAll('.cell');

                for (let c of cells) {
                    let $table = createTable(capacity, type.toLowerCase());
                    $(c).append($table);
                }
            }

        }


    };

    liInsertRowBefore.onclick = function (e) {
        let divCellActingUpon = ulContextMenu['acting-upon'];
        let divRowActingUpon = divCellActingUpon.parentElement;
        let $divRow = $(`<div class='row'></div>`);
        populateRowWithCells($divRow);
        $divRow.insertBefore(divRowActingUpon);
        noOfRows++;
        $(ulContextMenu).hide();
        e.stopPropagation();
    };

    liInsertRowAfter.onclick = function (e) {
        let divCellActingUpon = ulContextMenu['acting-upon'];
        let divRowActingUpon = divCellActingUpon.parentElement;
        let $divRow = $(`<div class='row'></div>`);
        populateRowWithCells($divRow);
        $divRow.insertAfter(divRowActingUpon);
        noOfRows++;
        $(ulContextMenu).hide();
        e.stopPropagation();
    };

    liInsertColumnToLeft.onclick = function (e) {
        let divCellActingUpon = ulContextMenu['acting-upon'];
        let indexOfCell = $(divCellActingUpon).index();
        addColumnAtIndex(indexOfCell, true);
        noOfColumns++;
        $(ulContextMenu).hide();
        e.stopPropagation();
    };

    liInsertColumnToRight.onclick = function (e) {
        let divCellActingUpon = ulContextMenu['acting-upon'];
        let indexOfCell = $(divCellActingUpon).index();
        addColumnAtIndex(indexOfCell, false);
        noOfColumns++;
        $(ulContextMenu).hide();
        e.stopPropagation();
    };

    liDeleteRow.onclick = function (e) {
        let divCellActingUpon = ulContextMenu['acting-upon'];
        let divRowActingUpon = divCellActingUpon.parentElement;
        $(divRowActingUpon).remove();
        noOfRows--;
        $(ulContextMenu).hide();
        e.stopPropagation();
    };

    liDeleteColumn.onclick = function (e) {

        let divCellActingUpon = ulContextMenu['acting-upon'];
        let index = $(divCellActingUpon).index();

        let rows = divRoom.querySelectorAll('.row');

        for (let i = 0; i < rows.length; i++) {
            let row = rows.item(i);
            let cells = row.querySelectorAll('.cell');
            let cell = cells.item(index);
            $(cell).remove();
        }


        noOfColumns--;
        $(ulContextMenu).hide();
        e.stopPropagation();
    };

    liAddOrDeleteTable.onclick = function (e) {

        let divCellActingUpon = ulContextMenu['acting-upon'];
        let divTable = divCellActingUpon.querySelector('.table');

        if (divTable) {
            $(divTable).remove();
        }
        else {
            let capacity = prompt('Enter table capacity');
            let $table = createTable(capacity, 'free');
            $(divCellActingUpon).append($table);
        }

        $(ulContextMenu).hide();
        e.stopPropagation();
    };

    function populateRowWithCells($divRow) {
        for (let j = 1; j <= noOfColumns; j++) {
            let $divCell = $(`<div class='cell'></div>`);
            $divRow.append($divCell);
            $divCell.click(cell_Click);
        }
    }

    function addColumnAtIndex(index, left) {

        let rows = divRoom.querySelectorAll('.row');

        for (let i = 0; i < rows.length; i++) {
            let row = rows.item(i);
            let cells = row.querySelectorAll('.cell');
            let cellToTarget = cells.item(index);
            let $cell = $(`<div class='cell'></div>`);
            $cell.click(cell_Click);
            if (left) $cell.insertBefore(cellToTarget);
            else $cell.insertAfter(cellToTarget);
        }

    }

    function cell_Click(e) {

        $([ulSeatMenu, ulTableMenu]).hide();

        let table = this.querySelector('.table');

        if (table) {
            liAddOrDeleteTable.innerText = 'Delete table';
        }
        else {
            liAddOrDeleteTable.innerText = 'Insert table';
        }

        ulContextMenu['acting-upon'] = this;
        ulContextMenu.style.top = e.clientY + 'px';
        ulContextMenu.style.left = e.clientX + 'px';
        $(ulContextMenu).show();
        e.stopPropagation();

    }

    function seat_Click(e) {

        $([ulContextMenu, ulTableMenu]).hide();

        ulSeatMenu['acting-upon'] = this;
        ulSeatMenu.style.top = e.clientY + 'px';
        ulSeatMenu.style.left = e.clientX + 'px';
        $(ulSeatMenu).show();

        e.stopPropagation();

    }

    function table_Click(e) {
        $([ulContextMenu, ulSeatMenu]).hide();
        ulTableMenu['acting-upon'] = this;
        ulTableMenu.style.top = e.clientY + 'px';
        ulTableMenu.style.left = e.clientX + 'px';
        $(ulTableMenu).show();
        e.stopPropagation();
    }

    function createSeat(type) {
        let $seat = $(`<div class='seat s-${type}'></div>`);
        $seat[0]['type'] = type;
        $seat.click(seat_Click);
        return $seat;
    }

    function createTable(capacity, type) {

        let tableTemplate = `<div class='table'>
                                <div class='block'></div>
                             </div>`;

        let $table = $(tableTemplate);
        $table.click(table_Click);
        $table[0]['capacity'] = capacity;

        for (let i = 1; i <= capacity; i++) {
            let $seat = createSeat(type);
            $table.append($seat);
        }

        return $table;
    }

    function changeSeatType(seat, type) {
        seat['type'] = type;
        $(seat).attr('class', '').addClass(['seat', `s-${type}`]);
    }

    liMarkAsRed.onclick = function (e) {
        let seat = ulSeatMenu['acting-upon'];
        changeSeatType(seat, 'red');
        $(ulSeatMenu).hide();
        e.stopPropagation();
    }

    liMarkAsGold.onclick = function (e) {
        let seat = ulSeatMenu['acting-upon'];
        changeSeatType(seat, 'gold');
        $(ulSeatMenu).hide();
        e.stopPropagation();
    }

    liMarkAsBlocked.onclick = function (e) {
        let seat = ulSeatMenu['acting-upon'];
        changeSeatType(seat, 'blocked');
        $(ulSeatMenu).hide();
        e.stopPropagation();
    }

    liMarkAsFree.onclick = function (e) {
        let seat = ulSeatMenu['acting-upon'];
        changeSeatType(seat, 'free');
        $(ulSeatMenu).hide();
        e.stopPropagation();
    }

    liExtendCapacity.onclick = function (e) {

        let extendBy = + prompt('Extend table capacity by');
        let table = ulTableMenu['acting-upon'];

        for (let i = 1; i <= extendBy; i++) {
            let $seat = createSeat();
            $(table).append($seat);
        }

        table.capacity = +table.capacity + extendBy;

        $(ulTableMenu).hide();
        e.stopPropagation();
    }

    liMarkAllAsFree.onclick = function (e) {

        let table = ulTableMenu['acting-upon'];
        let seats = table.querySelectorAll('.seat');

        seats.forEach(s => changeSeatType(s, 'free'));

        $(ulTableMenu).hide();
        e.stopPropagation();
    };

    liMarkAllAsRed.onclick = function (e) {

        let table = ulTableMenu['acting-upon'];
        let seats = table.querySelectorAll('.seat');

        seats.forEach(s => changeSeatType(s, 'red'));

        $(ulTableMenu).hide();
        e.stopPropagation();
    };

    liMarkAllAsGold.onclick = function (e) {

        let table = ulTableMenu['acting-upon'];
        let seats = table.querySelectorAll('.seat');

        seats.forEach(s => changeSeatType(s, 'gold'));

        $(ulTableMenu).hide();
        e.stopPropagation();
    };

    liMarkAllAsBlocked.onclick = function (e) {

        let table = ulTableMenu['acting-upon'];
        let seats = table.querySelectorAll('.seat');

        seats.forEach(s => changeSeatType(s, 'blocked'));

        $(ulTableMenu).hide();
        e.stopPropagation();
    };



};