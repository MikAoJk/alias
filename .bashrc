alias cdgit='cd /c/Users/JoakimKartveit/git'
alias setjdk8='JAVA_HOME="C:\Program Files\Java\jdk-1.8.0.275"'
alias setjdk13='JAVA_HOME="C:\Program Files\Java\jdk-13.0.2"'
alias setjdk14='JAVA_HOME="C:\Program Files\Java\jdk-14.0.2"'
alias setmvn352='M2_HOME="C:\Program Files\maven\apache-maven-3.5.2" && MAVEN_HOME="C:\Program Files\maven\apache-maven-3.5.2" && PATH="$PATH:C:\Program Files\maven\apache-maven-3.5.2\bin"'
alias setmvn363='M2_HOME="C:\Program Files\maven\apache-maven-3.6.3" && MAVEN_HOME="C:\Program Files\maven\apache-maven-3.6.3\bin" && PATH="$PATH:C:\Program Files\maven\apache-maven-3.6.3\bin"'
alias findpidforport='cmd //c netstat -aon | findstr $1'
alias killpid='cmd //c taskkill //F //PID $1'
alias mvncleaninstallskipjoakim='mvn clean install -P joakim -DskipTests=true -l output.log'
alias mvncleaninstalljoakim='mvn clean install -P joakim -l output.log'
alias forceDelete='rm -rf .git'
alias setjdk11='JAVA_HOME="C:\Program Files\Java\jdk-11"'
export PATH="C:\Program Files\kubectl":$PATH