// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require_tree .

$('#close').click(function() {
    location.reload();
});

<<<<<<< HEAD
    $scope.setCategory = function(category){
      $scope.categorySelected = category;
    }

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
      this.className = "";
    });

    // Event Listener for when the dragged element dropped in the drop zone.
    dropZoneOne.addEventListener('drop', function(e) {
    var data = e.dataTransfer.getData('text');
      if (e.preventDefault) e.preventDefault(); 
      if (e.stopPropagation) e.stopPropagation(); 

      this.className = "";
      
      // $scope.dropZoneLink = "<%#= new_category_item_path($scope.category) %>";
      $scope.dropZoneLink = "http://localhost:3000/categories/"+$scope.categorySelected+"/items/new_item";
      console.log("dropped " + data);
      console.log($scope.dropZoneLink);
      //window.location.href = e.dataTransfer.getData('text');
      window.location.href = $scope.dropZoneLink;
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
      window.location.href = $scope.dropZoneLink;




    });
  };
}]);
=======
>>>>>>> 46256b23139f203930880ffeecef472b8e8f85f0


