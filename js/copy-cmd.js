document.addEventListener('DOMContentLoaded', function () {
  document.querySelectorAll('.copy-cmd').forEach(function (cell) {
    cell.addEventListener('click', function () {
      navigator.clipboard.writeText(cell.dataset.cmd).then(function () {
        cell.classList.add('copied');
        setTimeout(function () { cell.classList.remove('copied'); }, 1500);
      });
    });
  });
});
