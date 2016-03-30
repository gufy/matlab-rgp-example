function [ ] = cp_save( params )

paramstr = cp_struct2str(params, '&');

url = ['http://vojtechkopal.cz/regressions/save_sample.php?', paramstr];
sent = 0;
numtry = 1;

while sent == 0
try
	urlread(url);
	sent = 1;
catch e
	if numtry < 5
		display(['Faild to save result: ', url]);
        display('Trying again ...');
		pause(2^(numtry-1));
		numtry = numtry + 1;
	else
		m = ['Cannot save result: ', url];
		if err
			m = [ m , ' ', err_report ] ; 
		end
		error(m);
	end
end
end

end

