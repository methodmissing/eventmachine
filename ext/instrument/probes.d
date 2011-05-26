typedef uint64_t VALUE;
provider eventmachine {
    probe trace__entry(VALUE loop_time, char *context);
    probe trace__return(VALUE loop_time, char *context);

    probe get__binding__entry(VALUE loop_time, VALUE binding);
    probe get__binding__return(VALUE loop_time, VALUE binding);

    probe connection__read__entry(VALUE loop_time, VALUE signature, char *data, VALUE len);
    probe connection__read__return(VALUE loop_time, VALUE signature, char *data, VALUE len);

    probe send__data__entry(VALUE loop_time, VALUE signature, char *data, VALUE len);
    probe send__data__return(VALUE loop_time, VALUE signature, int bytes);

    probe data__sent(VALUE loop_time, VALUE signature, char *data, VALUE len);

    probe connection__accepted__entry(VALUE loop_time, VALUE signature);
    probe connection__accepted__return(VALUE loop_time, VALUE signature);

    probe connection__unbound__entry(VALUE loop_time, VALUE signature);
    probe connection__unbound__return(VALUE loop_time, VALUE signature);

    probe connection__completed__entry(VALUE loop_time, VALUE signature);
    probe connection__completed__return(VALUE loop_time, VALUE signature);

    probe connection__notify__readable__entry(VALUE loop_time, VALUE signature);
    probe connection__notify__readable__return(VALUE loop_time, VALUE signature);

    probe connection__notify__writable__entry(VALUE loop_time, VALUE signature);
    probe connection__notify__writable__return(VALUE loop_time, VALUE signature);

    probe loopbreak__signal__entry(VALUE loop_time);
    probe loopbreak__signal__return(VALUE loop_time);

    probe timer__fired__entry(VALUE loop_time, VALUE signature);
    probe timer__fired__return(VALUE loop_time, VALUE signature);

    probe ssl__handshake__completed__entry(VALUE loop_time, VALUE signature);
    probe ssl__handshake__completed__return(VALUE loop_time, VALUE signature);

    probe ssl__verify__entry(VALUE loop_time, VALUE signature, char *data, VALUE len);
    probe ssl__verify__return(VALUE loop_time, VALUE signature, char *data, VALUE len);

    probe proxy__target__unbound__entry(VALUE loop_time, VALUE signature);
    probe proxy__target__unbound__return(VALUE loop_time, VALUE signature);

    probe proxy__completed__entry(VALUE loop_time, VALUE signature);
    probe proxy__completed__return(VALUE loop_time, VALUE signature);
};