function upload() {
    const reader = new FileReader();
    reader.onloadend = function() {
      
        const ipfs = window.IpfsApi('127.0.0.1', 5001) // Connect to IPFS

        const buf = buffer.Buffer(reader.result) // Convert data into buffer
        ipfs.files.add(buf, (err, result) => { // Upload buffer to IPFS
        if(err) {
          console.error(err)
          return
        }
        let url = `http://127.0.0.1:8080/ipfs/${result[0].hash}`
        console.log(`Url --> ${url}`)
        document.getElementById("url").innerHTML= url
        document.getElementById("url").href= url
        document.getElementById("output").src = url
      })
    }
    const proof = document.getElementById("proof");
    reader.readAsArrayBuffer(proof.files[0]); // Read Provided File
  }