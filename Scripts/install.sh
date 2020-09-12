echo "Checking Homebrew"

if [[ -z $(command -v brew) ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

echo "Checking Dependencies"

dependencies=(swiftgen bartycrouch)

for dependency in ${dependencies[*]}
do 		
	if brew ls --versions $dependency > /dev/null; then
		echo "$dependency - installed"
	else
		echo "installing $dependency"
		brew install $dependency
	fi
done
