var app = angular.module('WefridgeratorApp', []);
app.controller('dragNdrop', ['$scope', '$http', function($scope, $http) {
  console.log('angular loaded');

  window.onload = function() {

    $scope.filter_view = "All";
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
    console.log("this is the container: " + $scope.group);
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
  };

}]);

