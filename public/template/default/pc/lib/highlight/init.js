document.addEventListener('DOMContentLoaded', (event) => {
    document.querySelectorAll('pre').forEach((pre) => {
        pre.classList.add('ape-code-pre');
        pre.querySelectorAll('code').forEach((block) => {
            hljs.highlightBlock(block);
        });
    });
});
$('pre').append('<div class="code-bar"><i class="fal fa-clone code-bar-btn-copy-fonticon" title="复制"></i></div>')
$("pre code").each(function () {
    $(this).html("<ul class='hijs-line-number'><li>" + $(this).html().replace(/\n/g, "\n</li><li>") + "\n</li></ul>");
});
