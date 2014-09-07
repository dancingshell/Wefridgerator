var app = angular.module('WefridgeratorApp', []);
app.controller('dragNdrop', ['$scope', '$http', function($scope, $http) {
  console.log('angular loaded');

  window.onload = function() {
    $scope.page_start = 0
    $scope.page_end = 5
    
    $scope.active_cats = function() {
      return $scope.cats.slice($scope.page_start, $scope.page_end);
    }

    $scope.cat_length = $scope.cats.length
    $scope.end_button = true;
    $scope.start_button = false;
    
    $scope.page_move = function(direction) {
      $scope.page_start += direction;
      console.log("start: " + $scope.page_start);
      $scope.page_end += direction;
      if ($scope.page_end >= $scope.cats.length) {
        $scope.end_button = false;
      }
      else {
        $scope.end_button = true;
      }
      if ($scope.page_start <= 0) {
        $scope.start_button = false;
      }
      else {
        $scope.start_button = true;
      }


      console.log("end: " + $scope.page_end);
    }

    $scope.filter_view = "All";
    // default view is All
    $scope.filter = function(filter) {
      $scope.filter_view = filter;
    }

    $scope.editModal = function(category, item) {
      $scope.item = item;
      console.log("item: "+ $scope.item);
      $scope.category = category;
      
      console.log("test modal");
      $('.modal').modal({remote: "http://localhost:3000/categories/" + $scope.category +"/items/" + $scope.item + "/edit"});
    }

    $scope.deleteItem = function(category, item, item_id ) {
      $scope.item_id = item_id;
      $scope.category = category;
      console.log(item);
      if (item.id) {
        console.log("inside the if");
        // saved member
        $http.delete("http://localhost:3000/categories/" + $scope.category +"/items/" + $scope.item_id);
          // success(function(data, status, headers, config) {
          // // this callback will be called asynchronously
          // // when the response is available
          //  }).
          //   error(function(data, status, headers, config) {
          // // called asynchronously if an error occurs
          // // or server returns response with an error status.
          // });
      }
      //   $http.delete("http://localhost:3000/categories/" + $scope.category +"/items/" + $scope.item_id);
      // }
      else {
        // unsaved member, remove it from members.
        $scope.itemData.splice( $.inArray(item, $scope.itemData), 1 );
      }
    };

    $scope.setCategory = function(category){
       $scope.categorySelected = category;
    }
    $http.get("http://localhost:3000/groups/" + $scope.group + "/api/items").success(function (data) {
    //Convert data to array.
      $scope.itemData = angular.fromJson(angular.fromJson(data));
      console.log($scope.itemData);
    });

    var dropZoneOne = document.querySelector('#drop-target-one');
    var dragElements = document.querySelectorAll('#drag-elements li');
    var elementDragged = null;

    for (var i = 0; i < dragElements.length; i++) {
      // Event Listener for when the drag interaction starts.
      dragElements[i].addEventListener('dragstart', function(e) {
        e.dataTransfer.effectAllowed = 'move';
        elementDragged = this;
      });
      // Event Listener for when the drag interaction finishes.
      dragElements[i].addEventListener('dragend', function(e) {
        elementDragged = null;
      });
    };

    // Event Listener for when the dragged element is over the drop zone.
    dropZoneOne.addEventListener('dragover', function(e) {
      if (e.preventDefault) {
        e.preventDefault();
      }
      e.dataTransfer.dropEffect = 'move';

      return false;
    });

    // Event Listener for when the dragged element enters the drop zone.
    dropZoneOne.addEventListener('dragenter', function(e) {
      this.className = "over";
    });

    // Event Listener for when the dragged element leaves the drop zone.
    dropZoneOne.addEventListener('dragleave', function(e) {
    // When it leaves the drop zone, do nothing
      this.className = "";
    });

    // Event Listener for when the dragged element dropped in the drop zone.
    dropZoneOne.addEventListener('drop', function(e) {
      // dataTransfer obtains the data
    var data = e.dataTransfer.getData('text');
      // not sure if needed, but will leave just in case
      if (e.preventDefault) e.preventDefault(); 
      if (e.stopPropagation) e.stopPropagation(); 

      this.className = "";
      
      
      $scope.dropZoneLink = "http://localhost:3000/categories/"+$scope.categorySelected+"/items/new_item";
      console.log("dropped " + data);
      console.log($scope.dropZoneLink);
      //window.location.href = e.dataTransfer.getData('text');
      // window.location.href = $scope.dropZoneLink;
      $('.modal').modal({remote: $scope.dropZoneLink});
      });

    var dropZoneTwo = document.querySelector('#drop-target-two');
    var dragElements = document.querySelectorAll('#drag-elements li');
    var elementDragged = null;

    for (var i = 0; i < dragElements.length; i++) {
      // Event Listener for when the drag interaction starts.
      dragElements[i].addEventListener('dragstart', function(e) {
        e.dataTransfer.effectAllowed = 'move';
        elementDragged = this;
      });
      // Event Listener for when the drag interaction finishes.
      dragElements[i].addEventListener('dragend', function(e) {
        elementDragged = null;
      });
    };

    // Event Listener for when the dragged element is over the drop zone.
    dropZoneTwo.addEventListener('dragover', function(e) {
      if (e.preventDefault) {
        e.preventDefault();
      }

      e.dataTransfer.dropEffect = 'move';

      return false;
    });

    // Event Listener for when the dragged element enters the drop zone.
    dropZoneTwo.addEventListener('dragenter', function(e) {
      this.className = "over";
    });

    // Event Listener for when the dragged element leaves the drop zone.
    dropZoneTwo.addEventListener('dragleave', function(e) {
      this.className = "";
    });

    // Event Listener for when the dragged element dropped in the drop zone.
    dropZoneTwo.addEventListener('drop', function(e) {
    var data = e.dataTransfer.getData('text');
      if (e.preventDefault) e.preventDefault(); 
      if (e.stopPropagation) e.stopPropagation(); 

      this.className = "";
      
      // $scope.dropZoneLink = "<%#= new_category_item_path($scope.category) %>";
      $scope.dropZoneLink = "http://localhost:3000/categories/"+$scope.categorySelected+"/items/new_sl";
      console.log("dropped " + data);
      console.log($scope.dropZoneLink);
      //window.location.href = e.dataTransfer.getData('text');
      // window.location.href = $scope.dropZoneLink;
      $('.modal').modal({remote: $scope.dropZoneLink});
    });

        var langs =
    [['Afrikaans',       ['af-ZA']],
     ['Bahasa Indonesia',['id-ID']],
     ['Bahasa Melayu',   ['ms-MY']],
     ['Català',          ['ca-ES']],
     ['Čeština',         ['cs-CZ']],
     ['Deutsch',         ['de-DE']],
     ['English',         ['en-AU', 'Australia'],
                         ['en-CA', 'Canada'],
                         ['en-IN', 'India'],
                         ['en-NZ', 'New Zealand'],
                         ['en-ZA', 'South Africa'],
                         ['en-GB', 'United Kingdom'],
                         ['en-US', 'United States']],
     ['Español',         ['es-AR', 'Argentina'],
                         ['es-BO', 'Bolivia'],
                         ['es-CL', 'Chile'],
                         ['es-CO', 'Colombia'],
                         ['es-CR', 'Costa Rica'],
                         ['es-EC', 'Ecuador'],
                         ['es-SV', 'El Salvador'],
                         ['es-ES', 'España'],
                         ['es-US', 'Estados Unidos'],
                         ['es-GT', 'Guatemala'],
                         ['es-HN', 'Honduras'],
                         ['es-MX', 'México'],
                         ['es-NI', 'Nicaragua'],
                         ['es-PA', 'Panamá'],
                         ['es-PY', 'Paraguay'],
                         ['es-PE', 'Perú'],
                         ['es-PR', 'Puerto Rico'],
                         ['es-DO', 'República Dominicana'],
                         ['es-UY', 'Uruguay'],
                         ['es-VE', 'Venezuela']],
     ['Euskara',         ['eu-ES']],
     ['Français',        ['fr-FR']],
     ['Galego',          ['gl-ES']],
     ['Hrvatski',        ['hr_HR']],
     ['IsiZulu',         ['zu-ZA']],
     ['Íslenska',        ['is-IS']],
     ['Italiano',        ['it-IT', 'Italia'],
                         ['it-CH', 'Svizzera']],
     ['Magyar',          ['hu-HU']],
     ['Nederlands',      ['nl-NL']],
     ['Norsk bokmål',    ['nb-NO']],
     ['Polski',          ['pl-PL']],
     ['Português',       ['pt-BR', 'Brasil'],
                         ['pt-PT', 'Portugal']],
     ['Română',          ['ro-RO']],
     ['Slovenčina',      ['sk-SK']],
     ['Suomi',           ['fi-FI']],
     ['Svenska',         ['sv-SE']],
     ['Türkçe',          ['tr-TR']],
     ['български',       ['bg-BG']],
     ['Pусский',         ['ru-RU']],
     ['Српски',          ['sr-RS']],
     ['한국어',            ['ko-KR']],
     ['中文',             ['cmn-Hans-CN', '普通话 (中国大陆)'],
                         ['cmn-Hans-HK', '普通话 (香港)'],
                         ['cmn-Hant-TW', '中文 (台灣)'],
                         ['yue-Hant-HK', '粵語 (香港)']],
     ['日本語',           ['ja-JP']],
     ['Lingua latīna',   ['la']]];

    for (var i = 0; i < langs.length; i++) {
      select_language.options[i] = new Option(langs[i][0], i);
    }
    select_language.selectedIndex = 6;
    updateCountry();
    select_dialect.selectedIndex = 6;
    showInfo('info_start');

    function updateCountry() {
      for (var i = select_dialect.options.length - 1; i >= 0; i--) {
        select_dialect.remove(i);
      }
      var list = langs[select_language.selectedIndex];
      for (var i = 1; i < list.length; i++) {
        select_dialect.options.add(new Option(list[i][1], list[i][0]));
      }
      select_dialect.style.visibility = list[1].length == 1 ? 'hidden' : 'visible';
    }

    var create_email = false;
    var final_transcript = '';
    var recognizing = false;
    var ignore_onend;
    var start_timestamp;
    if (!('webkitSpeechRecognition' in window)) {
      upgrade();
    } else {
      start_button.style.display = 'inline-block';
      var recognition = new webkitSpeechRecognition();
      recognition.continuous = true;
      recognition.interimResults = true;

      recognition.onstart = function() {
        recognizing = true;
        showInfo('info_speak_now');
        start_img.src = 'assets/mic-animate.gif';
      };

      recognition.onerror = function(event) {
        if (event.error == 'no-speech') {
          start_img.src = 'assets/mic.gif';
          showInfo('info_no_speech');
          ignore_onend = true;
        }
        if (event.error == 'audio-capture') {
          start_img.src = 'assets/mic.gif';
          showInfo('info_no_microphone');
          ignore_onend = true;
        }
        if (event.error == 'not-allowed') {
          if (event.timeStamp - start_timestamp < 100) {
            showInfo('info_blocked');
          } else {
            showInfo('info_denied');
          }
          ignore_onend = true;
        }
      };

      recognition.onend = function() {
        recognizing = false;
        if (ignore_onend) {
          return;
        }
        start_img.src = 'assets/mic.gif';
        if (!final_transcript) {
          showInfo('info_start');
          return;
        }
        showInfo('');
        if (window.getSelection) {
          window.getSelection().removeAllRanges();
          var range = document.createRange();
          range.selectNode(document.getElementById('final_span'));
          window.getSelection().addRange(range);
        }
        if (create_email) {
          create_email = false;
          createEmail();
        }
      };

      recognition.onresult = function(event) {
        var interim_transcript = '';
        for (var i = event.resultIndex; i < event.results.length; ++i) {
          if (event.results[i].isFinal) {
            final_transcript += event.results[i][0].transcript;
          } else {
            interim_transcript += event.results[i][0].transcript;
          }
        }
        final_transcript = capitalize(final_transcript);
        final_span.innerHTML = linebreak(final_transcript);
        interim_span.innerHTML = linebreak(interim_transcript);
        if (final_transcript || interim_transcript) {
          showButtons('inline-block');
        }
        

        var item = final_span.innerHTML.split(' ');
        // console.log(item);
        if ((item[0] === 'Add') || (item[0] === 'add') && (item[1] === 'Item') || (item[1] === 'item')) {
            console.log(item[2]);
          var item_to_add = item[2];
          // $http.post("http://localhost:3000/categories/" + $scope.othercat + "/items/new_speech_item", item_to_add);
          console.log($scope.othercat);

          // var request = $http({
          //               method: "post",
          //               url: "http://localhost:3000/categories/" + $scope.othercat + "/items/speech",
          //               params: {
          //                   name: item_to_add
          //               },
          //               data: {
          //                   name: item_to_add
          //               }
                       
          //           });
      
          $http({
            url: "http://localhost:3000/categories/" + $scope.othercat + "/items/speech",
            method: "POST",
            data: { item: { name: item_to_add }}
          })
          .then(function(response) {
                console.log("yay" + response);
            }, 
            function(response) { // optional
                console.log("boo" + response);
            }
          );
          // $.ajax({
          //   type:'POST', 
          //   url: 'http://localhost:3000/categories/" + $scope.othercat + "/items/new_speech_item', 
          //   data: $.param({ item: {name: item_to_add, category: $scope.othercat}})
          // });
          // console.log(request);
        }
      }
    }

    function upgrade() {
      start_button.style.visibility = 'hidden';
      showInfo('info_upgrade');
    }

    var two_line = /\n\n/g;
    var one_line = /\n/g;
    function linebreak(s) {
      return s.replace(two_line, '<p></p>').replace(one_line, '<br>');
    }

    var first_char = /\S/;
    function capitalize(s) {
      return s.replace(first_char, function(m) { return m.toUpperCase(); });
    }

    function createEmail() {
      var n = final_transcript.indexOf('\n');
      if (n < 0 || n >= 80) {
        n = 40 + final_transcript.substring(40).indexOf(' ');
      }
      var subject = encodeURI(final_transcript.substring(0, n));
      var body = encodeURI(final_transcript.substring(n + 1));
      window.location.href = 'mailto:?subject=' + subject + '&body=' + body;
    }

    function copyButton() {
      if (recognizing) {
        recognizing = false;
        recognition.stop();
      }
      copy_button.style.display = 'none';
      copy_info.style.display = 'inline-block';
      showInfo('');
    }

    function emailButton() {
      if (recognizing) {
        create_email = true;
        recognizing = false;
        recognition.stop();
      } else {
        createEmail();
      }
      email_button.style.display = 'none';
      email_info.style.display = 'inline-block';
      showInfo('');
    }

    $scope.startButton = function(event) {
      if (recognizing) {
        recognition.stop();
        return;
      }
      final_transcript = '';
      recognition.lang = select_dialect.value;
      recognition.start();
      ignore_onend = false;
      final_span.innerHTML = '';
      interim_span.innerHTML = '';
      start_img.src = 'mic-slash.gif';
      showInfo('info_allow');
      showButtons('none');
      start_timestamp = event.timeStamp;
    }

    function showInfo(s) {
      if (s) {
        for (var child = info.firstChild; child; child = child.nextSibling) {
          if (child.style) {
            child.style.display = child.id == s ? 'inline' : 'none';
          }
        }
        info.style.visibility = 'visible';
      } else {
        info.style.visibility = 'hidden';
      }
    }

    var current_style;
    function showButtons(style) {
      if (style == current_style) {
        return;
      }
      current_style = style;
      copy_button.style.display = style;
      email_button.style.display = style;
      copy_info.style.display = 'none';
      email_info.style.display = 'none';
    }
  };

}]);

