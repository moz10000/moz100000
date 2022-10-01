$(document).ready(function(){
  let setTimeoutId = undefined;
  let startTime = 0;
  let currentTime = 0;
  let elapsedTime = 0;

  function runTimer(){
    currentTime = Date.now();
    showTime();
    setTimeoutId = setTimeout(() => {
      runTimer();
    })
  }

  function showTime(){
    let d = new Date(currentTime - startTime + elapsedTime);
    const getHours = d.getHours()-9;
    const getMin = d.getMinutes();
    const getSec = d.getSeconds();
    const getMillisec = Math.floor(d.getMilliseconds() / 10);

    $("#time").text(`${String(getHours).padStart(2,'0')}:${String(getMin).padStart(2,'0')}:${String(getSec).padStart(2,'0')}:${String(getMillisec).padStart(2,'0')}`);
  }

  function classReplacementRun() {
    $("#start").addClass("disabled");
    $("#stop").removeClass("disabled");
    $("#reset").addClass("disabled");
  }

  function classReplacementStop() {
    $("#start").removeClass("disabled");
    $("#stop").addClass("disabled");
    $("#reset").removeClass("disabled");
  }

  function classReplacementInitial() {
    $("#start").removeClass("disabled");
    $("#stop").addClass("disabled");
    $("#reset").addClass("disabled");
  }

  $("#start").mousedown(function(){
    if($(this).hasClass('disabled')){
      return;
    }
    classReplacementRun()
    startTime = Date.now();
    runTimer();
  });

  $("#stop").mousedown(function(){
    if($(this).hasClass('disabled')){
      return;
    }
    classReplacementStop()
    elapsedTime += currentTime - startTime;
    clearTimeout(setTimeoutId);
  });

  $("#reset").mousedown(function(){
    if($(this).hasClass('disabled')){
      return;
    }
    classReplacementInitial()
    clearTimeout(setTimeoutId);
    elapsedTime = 10
    $("#time").text("00:00:00:00");
  })

})
