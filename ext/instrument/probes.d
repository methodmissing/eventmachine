provider eventmachine {
    probe event__entry(unsigned long signature, char *event);
    probe event__return(unsigned long signature, char *event);
};
#pragma D attributes Evolving/Evolving/Common provider eventmachine provider
#pragma D attributes Private/Private/Unknown provider eventmachine module
#pragma D attributes Private/Private/Unknown provider eventmachine function
#pragma D attributes Evolving/Evolving/Unknown provider eventmachine name
#pragma D attributes Evolving/Evolving/Unknown provider eventmachine args