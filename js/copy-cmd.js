document.addEventListener('DOMContentLoaded', function () {
  function copyText(text) {
    if (navigator.clipboard && window.isSecureContext) {
      return navigator.clipboard.writeText(text);
    }

    return new Promise(function (resolve, reject) {
      var textArea = document.createElement('textarea');
      textArea.value = text;
      textArea.setAttribute('readonly', '');
      textArea.style.position = 'fixed';
      textArea.style.opacity = '0';
      document.body.appendChild(textArea);
      textArea.select();

      try {
        if (!document.execCommand('copy')) {
          throw new Error('Copy command failed');
        }
        resolve();
      } catch (error) {
        reject(error);
      } finally {
        textArea.remove();
      }
    });
  }

  document.querySelectorAll('.copy-cmd').forEach(function (cell) {
    cell.addEventListener('click', function () {
      copyText(cell.dataset.cmd).then(function () {
        cell.classList.add('copied');
        setTimeout(function () { cell.classList.remove('copied'); }, 1500);
      });
    });
  });

  document.querySelectorAll('#main pre').forEach(function (codeBlock) {
    var wrapper = document.createElement('div');
    var button = document.createElement('button');

    wrapper.className = 'code-block';
    codeBlock.parentNode.insertBefore(wrapper, codeBlock);
    wrapper.appendChild(codeBlock);

    button.className = 'copy-code-button';
    button.type = 'button';
    button.setAttribute('aria-label', 'Copy code to clipboard');
    wrapper.appendChild(button);

    button.addEventListener('click', function () {
      copyText(codeBlock.textContent).then(function () {
        button.setAttribute('aria-label', 'Code copied');
        button.classList.add('copied');
        setTimeout(function () {
          button.setAttribute('aria-label', 'Copy code to clipboard');
          button.classList.remove('copied');
        }, 1500);
      });
    });
  });
});
