HomeCtrl = function($scope,Post,Review,$location,Auth,$routeParams,$http,flash) {
  angular.element(document).ready(function () {
    $http({
      method: 'GET',
      url: '/banking_list',
      headers: {'Content-Type': 'application/x-www-form-urlencoded'}
     }).success(function(result){
      $scope.userdata = result
    });
  });

  $scope.amtFlag = false;
  $scope.getAmount = function (user) {
    if (user == undefined) {
      alert("Please select your username")
    } else {
  $scope.amtFlag = false;
     $http({
          method: 'GET',
          url: '/username?username='+user,
          headers: {'Content-Type': 'application/x-www-form-urlencoded'}
         }).success(function(result){
          $scope.details = result
          $scope.amtFlag = true;
        });
    }
  }

  $scope.creditAmt = function (user,amt) {
    if (user == undefined || amt == undefined) {
      alert('Please enter all the fields')
    }
    else {
     $http({
          method: 'GET',
          url: '/credit?user_id='+user+'&&credits='+amt,
          headers: {'Content-Type': 'application/x-www-form-urlencoded'}
         }).success(function(result){
          $scope.credit = result
          alert('Transaction successfully done')
          window.location.reload();
        });
    }
  }

  $scope.debitAmt = function (user, amt) {
    if (user == undefined || amt == undefined) {
      alert('Please enter all the fields')   
    } else {
     $http({
          method: 'GET',
          url: '/debit?user_id='+user+'&&debits='+amt,
          headers: {'Content-Type': 'application/x-www-form-urlencoded'}
         }).success(function(result){
          $scope.debit = result
          alert('Transaction successfully done')
          window.location.reload();
        });
    }

  }
  $scope.amttransfer = function (creditor,debitor,trnsamt) {
    if (creditor == debitor) {
      alert("Sorry! You cannot transfer to same account")
    } else {
      if (creditor == undefined || debitor == undefined || trnsamt == undefined) {
        alert('Please enter all the fields')   
      } else {
       $http({
            method: 'GET',
            url: 'transactions?user_id='+creditor+'&&payee_id='+debitor+'&&debits='+trnsamt,
            headers: {'Content-Type': 'application/x-www-form-urlencoded'}
           }).success(function(result){
            $scope.debit = result
            alert('Transaction successfully done')
            window.location.reload();
          });
      }
    }
  }
  $scope.transactionFlag = false;
  $scope.transaction = function (user) {
    if (user == undefined) {
      alert("please select your accont")
    } else {
      $scope.transactionFlag = false;
             $http({
              method: 'GET',
              url: '/transactions_list?user_id='+user,
              headers: {'Content-Type': 'application/x-www-form-urlencoded'}
             }).success(function(result){
              $scope.usertransaction = result
              $scope.transactionFlag = true;
            });
    }
  }
};