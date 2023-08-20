/* Code written by Micah Cochran */

function copyToClipBoard(obj) {
    text = obj.innerText;
    navigator.clipboard.writeText(text).then(() => {
            console.log('Content copied to clipboard');
            /* Resolved - text copied to clipboard successfully */
    },() => {
            console.error('Failed to copy');
            /* Rejected - text failed to copy to the clipboard */
    });
}

// add copy to clipboard for every element in the clipboard class.
const clipboardElements = document.getElementsByClassName('clipboard');

for(cb of clipboardElements) {
        // add click to class='clipboard'
        cb.addEventListener("click", 
                            function() { 
                                copyToClipBoard(cb)
                            });
}

// Hide elements in the 'nojs' class.
// 'nojs' is content intended to be displayed when JavaScript is disabled.
// This was created so that browsers not having javascript enables could still the text of a screencast.
// This has the added benefit of making the text available for search engines. 
const noJsElements = document.getElementsByClassName('nojs');

for(hideElement of noJsElements) {
        hideElement.style.display = 'none';
}