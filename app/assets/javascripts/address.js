
// Manage autocomplete for address blocks
$(document).on('ready page:load turbolinks:load', function() {
    $.each($('.js-address'), function(i, address) {
        var $address = $(address);
        if ($address.find('.js-normalize').is(':checked')){
            setAddressAutocomplete($address);
        }else{
        // Block rest of the fields
        $address.on('change', '.js-normalize', function () {
            var blocked_fields = ['.js-road_number_type', '.js-road_type select', '.js-grader', '.js-postal_code'];
            var $normalizeInput = $(this);
            var $_address = $normalizeInput.closest('.js-address');
            if ($normalizeInput.is(':checked')){

                // Prevent road type select from opening
                $address.find('.js-road_type select').on('mousedown', function(e) {
                    if ($(this).closest('.js-address').find('.js-normalize').is(':checked')){
                        e.preventDefault();
                        this.blur();
                        window.focus();
                    }
                });

                blocked_fields.forEach(function (field_selector, index) {
                    $_address.find(field_selector).attr('readonly', 'readonly');
                });
                $('.js-road_number-select-wrapper').removeAttr('hidden');
                $('.js-road_number-select').removeAttr('disabled');
                $('.js-road_number-input-wrapper').attr('hidden', 'hidden');
                $('.js-road_number-input').attr('disabled', 'disabled');
                addAddressAutocomplete($_address);
            }else{
                blocked_fields.forEach(function (field_selector, index) {
                    $_address.find(field_selector).removeAttr('readonly');
                });
                $('.js-road_number-select-wrapper').attr('hidden', 'hidden');
                $('.js-road_number-select').attr('disabled', 'disabled');
                $('.js-road_number-input-wrapper').removeAttr('hidden');
                $('.js-road_number-input').removeAttr('disabled');
                removeAddressAutocomplete($_address);
            }
        });
        }
    });
});

// Allow autocomple after adding a new address block
$(document).on('nested:fieldAdded', function(event){
    var $addNestedField = $($(this)[0].activeElement);
    var $newAddedAddress = $addNestedField.closest('.events-block').find('.event-fields:last .js-address');
    setAddressAutocomplete($newAddedAddress);
});

var setAddressAutocomplete = function ($address) {
    addAddressAutocomplete($address);
    blockBdcFields($address);
};

// Block BDC fields
var blockBdcFields = function ($address) {

    // Prevent road type select from opening
    $address.find('.js-road_type select').on('mousedown', function(e) {
        if ($(this).closest('.js-address').find('.js-normalize').is(':checked')){
            e.preventDefault();
            this.blur();
            window.focus();
        }
    });

    // Block rest of the fields
    var blocked_fields = ['.js-road_number_type', '.js-road_type select', '.js-grader', '.js-postal_code'];
    $address.on('change', '.js-normalize', function () {
        var $normalizeInput = $(this);
        var $_address = $normalizeInput.closest('.js-address');
        if ($normalizeInput.is(':checked')){

            // Prevent road type select from opening
            $address.find('.js-road_type select').on('mousedown', function(e) {
                if ($(this).closest('.js-address').find('.js-normalize').is(':checked')){
                    e.preventDefault();
                    this.blur();
                    window.focus();
                }
            });

            blocked_fields.forEach(function (field_selector, index) {
                $_address.find(field_selector).attr('readonly', 'readonly');
            });
            $('.js-road_number-select-wrapper').removeAttr('hidden');
            $('.js-road_number-select').removeAttr('disabled');
            $('.js-road_number-input-wrapper').attr('hidden', 'hidden');
            $('.js-road_number-input').attr('disabled', 'disabled');
            addAddressAutocomplete($_address);
        }else{
            blocked_fields.forEach(function (field_selector, index) {
                $_address.find(field_selector).removeAttr('readonly');
            });
            $('.js-road_number-select-wrapper').attr('hidden', 'hidden');
            $('.js-road_number-select').attr('disabled', 'disabled');
            $('.js-road_number-input-wrapper').removeAttr('hidden');
            $('.js-road_number-input').removeAttr('disabled');
            removeAddressAutocomplete($_address);
        }
    });
};

var removeAddressAutocomplete = function($address) {
    $address.find(".js-town").autocomplete({source: []});
    $address.find(".js-road_name").autocomplete({source: []});
};

var addAddressAutocomplete = function($address) {
    function fillTown($townInput, message) {
        $townInput.scrollTop(0);
        $townInput.val(message);
    }

    // AUTOCOMPLETE TOWN
    var $input = $address.find(".js-town")
    var searchTownsUrl = $input.data('js-search-towns-url');
    $input.autocomplete({
        source: function(request, response) {

            var value = $.trim($input.val());
            if(value.length > 0){
                $.ajax({
                    url: searchTownsUrl,
                    dataType: "json",
                    data: {
                        address: {
                            country: $address.find(".js-country").val(),
                            province: $address.find(".js-province").val(),
                            town: $address.find(".js-town").val(),
                            road_type: $address.find(".js-road_type option:selected").val(),
                            road_name: $address.find(".js-road_name").val(),
                            road_number_type: $address.find(".js-road_number_type").val(),
                            road_number: $address.find(".js-road_number").val(),
                            grader: $address.find(".js-grader").val(),
                            stairs: $address.find(".js-stairs").val(),
                            floor: $address.find(".js-floor").val(),
                            door: $address.find(".js-door").val()
                        },
                    },
                    success: function(data) {
                        response(data.towns);
                    }
                });
            }
        },
        minLength: 3,
        select: function(event, ui) {
            fillTown($(this), ui.item ? ui.item.label : "Nothing selected, input was " + this.value);
        },
        open: function() {
        },
        close: function() {
            $('.ui-autocomplete-loading').removeClass('ui-autocomplete-loading');
            $address = $(this).closest(".js-address");
            $address.find(".js-road_type select").prop('selectedIndex',0);
            $address.find(".js-road_name").val('');
            $address.find(".js-road_number_type").val('');
            $address.find(".js-road_number-select").prop('selectedIndex',0);
            $address.find(".js-grader").val('');
            $address.find(".js-postal_code").val('');
        }
    });

    // AUTOCOMPLETE ROAD NAME
    var roads;
    function fillRoadName($roadNameInput, message) {
        $roadNameInput.scrollTop(0);
        var roadName = message.split(" (")[0];
        var roadTypeName = message.split(" (")[1].replace(/\)/, "");
        var selectedRoad = roads.filter(function(road) {
            return ( road.nomvial == roadName && road.nomclase == roadTypeName );
        })[0];

        if (typeof selectedRoad !== 'undefined') {
            $roadNameInput.closest(".js-address").find(".js-road_type option").filter(function() {
                return $(this).text().toLowerCase() == selectedRoad.nomclase.toLowerCase();
            }).prop('selected', true);
        }
    }

    $address.find(".js-road_name").autocomplete({
        source: function(request, response) {
            var value = $.trim($address.find(".js-town").val());
            var searchRoadNamesUrl = $address.find('.js-road_name').data('js-search-road-names-url');
            if(value.length > 0) {
                $.ajax({
                    url: searchRoadNamesUrl,
                    dataType: "json",
                    data: {
                        address: {
                            country: $address.find(".js-country").val(),
                            province: $address.find(".js-province").val(),
                            town: $address.find(".js-town").val(),
                            road_type: '',
                            road_name: $address.find(".js-road_name").val(),
                            road_number_type: $address.find(".js-road_number_type").val(),
                            road_number: $address.find(".js-road_number-input").val(),
                            grader: $address.find(".js-grader").val(),
                            stairs: $address.find(".js-stairs").val(),
                            floor: $address.find(".js-floor").val(),
                            door: $address.find(".js-door").val()
                        }
                    },
                    success: function (data) {
                        roads = data.roads;
                        if (roads.length > 0){
                            var roadList = [];
                            $.each(roads, function (index, road) {
                                roadList.push(road.nomvial + ' (' + road.nomclase + ')');
                            });
                            response(roadList);

                        }else{
                            $address.find(".js-road_number_type").val('');
                            $address.find(".js-grader").val('');
                            $address.find(".js-postal_code").val('');
                            $address.find(".js-road_number-input").val('');
                            response({})
                        }
                    }
                });
            }else{
                alert('El campo "Población" no puede estar vacío');
                response({});
            }
        },
        minLength: 3,
        select: function(event, ui) {
            fillRoadName($(this), ui.item ? ui.item.label : "Nothing selected, input was " + this.value);
        },
        open: function() {
        },
        close: function() {
            $('.ui-autocomplete-loading').removeClass('ui-autocomplete-loading');
            $input = $(this);
            value = $input.val();
            $input.val(value.replace(/\s*\(\w*\)/, ""));
            $address = $input.closest(".js-address");
            $address.find(".js-road_number_type").val('');
            $address.find(".js-grader").val('');
            $address.find(".js-postal_code").val('');
            $address.find(".js-road_number-input").val('');


            // Fill ROAD NUMBER
            var value = $.trim($address.find(".js-road_name").val());
            var searchRoadNumbersUrl = $address.find('.js-road_number-input').data('js-search-road-numbers-url');
            if(value.length > 0) {
                $.ajax({
                    url: searchRoadNumbersUrl,
                    dataType: "json",
                    data: {
                        address: {
                            country: $address.find(".js-country").val(),
                            province: $address.find(".js-province").val(),
                            town: $address.find(".js-town").val(),
                            road_type: $address.find(".js-road_type option:selected").val(),
                            road_name: $address.find(".js-road_name").val(),
                        }
                    },
                    success: function (data) {
                        var numbers = data.numbers;
                        var numbersList = [];
                        $.each(numbers, function (index, number) {
                            if (number.calapp == null)
                                numbersList.push(number.numapp)
                            else
                                numbersList.push(number.numapp + ' (' + number.calapp + ')')
                        });
                        var selectArr = numbersList.map(function(elem){ return {val: elem, text: elem}});
                        var $roadNumberSelect = $('.js-road_number-select');
                        $roadNumberSelect.find('option').remove();
                        $roadNumberSelect.append($("<option>").attr('value', '').text(''));
                        $(selectArr).each(function() {
                            $roadNumberSelect.append($("<option>").attr('value',this.val).text(this.text));
                        });
                        $roadNumberSelect.removeAttr('readonly');
                        $roadNumberSelect.change(function(){
                            var selectedNumberOption = $(this).prop('value');
                            if (selectedNumberOption.indexOf("(") >= 0){
                                var numberName = selectedNumberOption.split(" (")[0];
                                var graderName = selectedNumberOption.split(" (")[1].replace(/\)/, "");
                            }else{
                                var numberName = selectedNumberOption;
                                var graderName = null;
                            }
                            $address = $(this).closest('.js-address');
                            $.ajax({
                                url: searchRoadNumbersUrl,
                                dataType: "json",
                                data: {
                                    address: {
                                        country: $address.find(".js-country").val(),
                                        province: $address.find(".js-province").val(),
                                        town: $address.find(".js-town").val(),
                                        road_type: $address.find(".js-road_type option:selected").val(),
                                        road_name: $address.find(".js-road_name").val(),
                                        road_number: numberName,
                                        grader: graderName,
                                    }
                                },
                                success: function (data) {
                                    var numbers = data.numbers;
                                    var selectedNumber = numbers.filter(function(number) {
                                        return ( number.numapp.toLowerCase() == numberName.toLowerCase() && number.calapp == graderName );
                                    })[0];

                                    if (typeof selectedNumber === 'undefined') {
                                        selectedNumber = numbers.filter(function (number) {
                                            return ( number.numapp.toLowerCase() == numberName.toLowerCase());
                                        })[0];
                                    }

                                    $address.find(".js-road_number_type").val(selectedNumber.nomapp);
                                    var graderValue = (selectedNumber.calapp != null) ? selectedNumber.calapp : '  ';
                                    $address.find(".js-grader").val(graderValue);
                                    $address.find('.js-postal_code').val(selectedNumber.codpostal)
                                }
                            });
                        });

                    },
                    error: function () {
                    }
                });
            }else{
                alert('El campo "Nombre de la vía" no puede estar vacío');
            }
        }
    });
};