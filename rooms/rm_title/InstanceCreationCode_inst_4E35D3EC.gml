var _ver_split = string_split(GM_version, ".");
var _ver_text = _ver_split[0] + "." + _ver_split[1];

if (_ver_split[2] > 0) _ver_text += "." + _ver_split[2];

text = $"v{_ver_text}";