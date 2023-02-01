load("render.star", "render")
load("encoding/base64.star", "base64")
load("xpath.star", "xpath")
load("http.star", "http")
load("time.star", "time")
load("humanize.star", "humanize")

KEY= ""

SIXOR = base64.decode("iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAIJJREFUOE+1U0EOwCAIsx/fYR9nkQTDapl6mEegpVBBE8+uZhzG3aBqX8EAquIqNwh6QdUld+Y6J1BgMxtjAJiURjNJ0MEMqlSAu6/AQRS4fwgmC2kHeW9bCtRYRyN8Eigbs4U9f2yj+rKljWzLCdjVMbMHxeEsb0ER5djWNa7kq/wD0rp8ESDkisgAAAAASUVORK5CYII=")
SIXGR = base64.decode("iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAINJREFUOE+1U9sNgDAIlFWcx8RZTZzHVTA0ocHzSMVo/wrcg1wrEznztiiWj3UXNnspOpANZ71OYAOZSlTGuUbAwKra1xCRm1MXowQGRlDmQlB9BHYix/1DgHGxdUoO2FrfEbAYY4TWL8fInmwaI8ZSATd3yGz3V3+BEcXao984ss/6J6t+mBHf+skPAAAAAElFTkSuQmCC")
ELEBL = base64.decode("iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAI9JREFUOE/tk0EOgCAMBO1dn6Y/0cfoT/RpescUs6TdlJDoVW4s7bChi3TBGuczsXxsg0S1TkRjVFw7KwAtqN1ib+a6DICYUsrWRcQ5Y91CCmBf+9yoxRaAvdUdgC0xAPZZR5/8gGdc+g46BV6YCuvTcnXIjMtBFNVa1B3AhqkFCZOIpk9/gfP+6je27EfnN+lfrxHS3b77AAAAAElFTkSuQmCC")
ELERD = base64.decode("iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAI9JREFUOE/tk7EOgCAMRO0v6Kqb/v8H6aar/gKmmCPtpYREV9k42seFHtIF6xznxPJwbBLVOhGNUXHtrAC0oHaLvZnrMgBiSilbFxHnjHULKYB+X3OjFlsA9lZ3ALbEANhnHX3yA55x6TvoFHhhKqxf09IhMy4HUVRrUXcAG6YWJEwimj79Bc77q9/Ysh+d35lfrxEezUr2AAAAAElFTkSuQmCC")

SIXORC2 = base64.decode("iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAH1JREFUOE+1k1EOgDAIQ+HiGr34FpawMCiRGfWT0CcdhQl87aDmy3wTo96liIRPoAmoiBVmpxkAKL6MizNOrxAMEDEQWTsTEP5eEFsr/A/AP31iR2zUJkhsfQOAa7QrlIbtNaLMutqSgzRMCSgkUfsqcfZHBS/s9TUWrIeWDjv4QRHwUO/QAAAAAElFTkSuQmCC")
SIXGRC2 = base64.decode("iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAIFJREFUOE+1k9kNgEAIRKUVbcejVo92tBUNJhDEIaJZ95NlHkwAqsCrx3b34W1YCOVegkj4BFJARiww280JQOK1n7V4M3W37gUCASxGIktRgK+eEVsr9AvAG47ssI1UB5GtMgA0RjtC/n89RrSy0UaW2UShZ9bZHxW8sM/XmPHucw459FoRA4O80QAAAABJRU5ErkJggg==")
ELEBLC2 = base64.decode("iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAIVJREFUOE9jZMACfHM//0cX3jyZlxGbWhRBbBoJGQQ3gBjNMMOQXQM2AKZ50yQesBq/vC8oFmMThxkCNwCkCKQRRsNMwCUONwDd6egGoBuE7DSQIYyjBjCixAJ6ooHFCjZxjGjElkzxiaEYgJyYiDEIIyXCNBGTnNEzFdYcRnZuJMb56GoABnVyEb00X+8AAAAASUVORK5CYII=")
ELERDC2 = base64.decode("iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAIVJREFUOE9jZMAC3sqo/EcXFn5yhxGbWhRBbBoJGQQ3gBjNMMOQXQM2AKZZ6PFtsJp3sqooFmMThxkCNwCkCKQRRsNMwCUONwDd6egGoBuE7DSQIYyjBjCixAJ6ooHFCjZxjGjElkzxiaEYgJyYiDEIIyXCNBGTnNEzFdYcRnZuJMb56GoA3FdyEY+9HlYAAAAASUVORK5CYII=")

### User inputs IDs of stops (up to 4)
## and then we run the queries

idE11 = "MTS_10518"
idW11 = "MTS_11271"
idN6 = "MTS_12814"
idS6 = "MTS_12078"

def getArrDep(id):
    urlStop = "https://realtime.sdmts.com/api/api/where/arrivals-and-departures-for-stop/" + id + ".xml?key="+ KEY+ "&minutesAfter=15"
    #print("URL is {}".format(urlStop))
    rep = http.get(urlStop)
    i = 0
    while i < 1000000:
        i += 1
    print(rep.body())
    x = xpath.loads(rep.body())
    currentTime = x.query("/org.onebusaway.api.model.ResponseBean/currentTime")
    final = x.query("/org.onebusaway.api.model.ResponseBean/data/entry/arrivalsAndDepartures/org.onebusaway.api.model.transit.ArrivalAndDepartureV2Bean/predictedArrivalTime")
    #final = x.query("/org.onebusaway.api.model.ResponseBean/data/entry/arrivalsAndDepartures/org.onebusaway.api.model.transit.ArrivalAndDepartureV2Bean/tripStatus/closestStopTimeOffset")
    if final == None:
        return "-"

    print("Current time is {}. Predicted arrival is {}".format(currentTime, final))
    minLeft = int((int(final) - int(currentTime)) / 60000)
    if minLeft <= 0:
        return "-"

    print("The value is frst: {} \n now is ".format(minLeft))

    return minLeft


def main():
    min11W = getArrDep(idW11)
    min11E = getArrDep(idE11)
    min6N = getArrDep(idN6)
    min6S = getArrDep(idS6)

    SIXGREEN = ""
    if min6N != "-" and int(min6N) <= 6:
        SIXGREEN = SIXGRC2
    else:
        SIXGREEN = SIXGR

    SIXORANGE = ""
    if min6S != "-" and int(min6S) <= 6:
        SIXORANGE = SIXORC2
    else:
        SIXORANGE = SIXOR

    ELEBLUE = ""
    if min11W != "-" and int(min11W) <= 6:
        ELEBLUE = ELEBLC2
    else:
        ELEBLUE = ELEBL

    ELERED = ""
    if min11E != "-" and int(min11E) <= 6:
        ELERED = ELERDC2
    else:
        ELERED = ELERD

    return render.Root(

        child = render.Column(
            children = [
                render.Row(
                    main_align="space_around",
                    children = [
                        render.Image(src=SIXGREEN),
                        render.Column(
                            children = [
                                render.WrappedText(
                                    content = str(min6N) + "'",
                                    font = "6x13",
                                    width = 16,
                                    align = "center",
                                ),
                            ]
                        ),
                        render.Image(src=SIXORANGE),
                        render.Column(
                            children = [
                                render.WrappedText(
                                    content =  str(min6S) +  "'",
                                    font = "6x13",
                                    width = 16,
                                    align = "center",
                                ),
                            ]
                        ),
                    ]
                ),
                render.Row(
                    children = [
                        render.Image(src=ELEBLUE),
                        render.Column(
                            children = [
                                render.WrappedText(
                                    content = str(min11W) +"'",
                                    font = "6x13",
                                    width = 16,
                                    align = "center",
                                ),
                            ]
                        ),
                        render.Image(src=ELERED),
                        render.Column(
                            children = [
                                render.WrappedText(
                                    content = str(min11E) + "'",
                                    font = "6x13",
                                    width = 16,
                                    align = "center",
                                ),
                            ]
                        ),
                    ]
                ),
            ],
        ),
    )
