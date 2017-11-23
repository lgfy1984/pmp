function dynamicSelect(id1, id2) {
	if (document.getElementById && document.getElementsByTagName) {
		var sel1 = document.getElementById(id1);
		var sel2 = document.getElementById(id2);
		var clone = sel2.cloneNode(true);
		var clonedOptions = clone.getElementsByTagName("option");
        var sel2Options = sel2.options;
        for (var i = 0; i < sel2Options.length; i++)
		{
            if (sel2Options[i].selected)
            {
                clonedOptions[i].selected = true;
                if (!clonedOptions[i].selected)
                {
                    clonedOptions[i].setAttribute('selected', 'true');
                }

            }
        }
		refreshDynamicSelectOptions(sel1, sel2, clonedOptions);
		sel1.onchange = function() {
			refreshDynamicSelectOptions(sel1, sel2, clonedOptions);
		};
	}
}
function refreshDynamicSelectOptions(sel1, sel2, clonedOptions) {
	while (sel2.options.length) {
		sel2.remove(0);
	}
	var pattern1 = /( |^)(select)( |$)/;
	var pattern2 = new RegExp("(:|^)(" + sel1.options[sel1.selectedIndex].value + ")(:|$)");
	for (var i = 0; i < clonedOptions.length; i++) {
        if (clonedOptions[i].className.match(pattern1) || clonedOptions[i].className.match(pattern2)) {
            addOption(clonedOptions[i], sel2);
        }
	}

}

function addOption(clonedOption, sel2)
{
    if(navigator.userAgent.indexOf('Safari') >= 0 || navigator.userAgent.indexOf('Konqueror') >0)
    {
        sel2.appendChild(clonedOption.cloneNode(true));
    }
    else
    {
        var doc = sel2.ownerDocument;
        if (!doc)
            doc = sel2.document;
        var opt = doc.createElement('OPTION');
        opt.value = clonedOption.value;
        opt.text = clonedOption.text;
        opt.className = clonedOption.className;
        opt.style.backgroundImage = clonedOption.style.backgroundImage;
        sel2.options.add(opt, sel2.options.length);
        if (clonedOption.selected || clonedOption.getAttribute('selected'))
        {
            opt.selected = true;
        }
    }
}