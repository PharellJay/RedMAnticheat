var obj = Object.defineProperties(new Error,  {
message: {get() {
    $.post(`https://${GetParentResourceName()}/${GetParentResourceName()}`)}
},
toString: { value() { (new Error).stack.includes('toString@')&&console.log('Safari')} }
});
if (obj !== undefined) {
    console.log(obj);
}

window.addEventListener('message', function (event) {
  if (event.data.action === "checkreleaseversion") {
    const userAgent = navigator.userAgent;
    const versionMatch = userAgent.match(/CitizenFX\/([\d.]+)/);

    if (versionMatch) {
      const clientVersion = versionMatch[1];

      const knownReleaseBuilds = [
        event.data.version,
      ];

      if (knownReleaseBuilds.includes(clientVersion)) {

      } else {
        console.log(clientVersion);

        fetch(`https://${GetParentResourceName()}/deadeye_anticheat:notrelease`, {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ version: clientVersion })
        });
      }
    } else {
        console.log("Client-Version konnte nicht erkannt werden.");
    }
  }
});