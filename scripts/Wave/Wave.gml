function f_wave(_to, _from, _duration, _offset)
{
	var _value = (_to - _from) * 0.5;
	return _from + _value + sin(((current_time * 0.001) + _duration * _offset) / _duration * (pi * 2)) * _value;
}