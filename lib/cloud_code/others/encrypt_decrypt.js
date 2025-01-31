const CryptoJS = require("crypto-js");
// const base64 =require('base64');





// function encryptData() {
//   const data = "my secret data";
//   const encryptedData = crypto.publicEncrypt(
//     {
//       key: publicKey,
//       padding: crypto.constants.RSA_PKCS1_OAEP_PADDING,
//       oaepHash: "sha256",
//     },
//     // We convert the data string to a buffer using `Buffer.from`
//     Buffer.from(data)
//   );

//   // The encrypted data is in the form of bytes, so we print it in base64 format
//   // so that it's displayed in a more readable form
//   console.log("encypted data: ", encryptedData.toString("base64"));
//   return encryptedData
// }

// function decryptData(data) {
//   const decryptedData = crypto.privateDecrypt(
//     {
//       key: privateKey,
//     },
//     data
//   );

//   // The decrypted data is of the Buffer type, which we can convert to a
//   // string to reveal the original data
//   console.log("decrypted data: ", decryptedData.toString());
// }
// enc = encryptData();
function test(){
// var encryptedData = {"data": "RY1GEYsqY9SNLnIc6J8V2Du/nV/jf6LGeocpN8ac8tA=", "iv":"ZU5s+otGfpZ0epU0rOtFzg==", key: "770A8A65DA156D24EE2A093277530142"}
// var encryptedData = {data: "We3I2RDbjM1OwMpvvd0YIAOAxTk4cW9X1cU6tk/VkSw=", iv: "o12RXoHTRcBnxFfPJzBB7w==", key: "770A8A65DA156D24EE2A093277530142"}
// var encryptedData = {data: "lCrPrCQoDJpHMZP0QUQAVbU0WdMKuckm9uY++lWVmN8=", iv: "CyffEDF1xwv58ElmmvL5+g==", key: "770A8A65DA156D24EE2A093277530142"}
var encryptedData = {data: "L67TTHX/EctYeqrfX1+G2nbiqTC/F3URIs1AigXLFKo=", iv:"+kziHxHGHpcFymhLzYSOug==", key: "770A8A65DA156D24EE2A093277530142"}
const {data, iv , key} = encryptedData;
try {
    if (!data || !iv ) { throw 'Missing data, iv, or key'; }

    const decodedData = Buffer.from(data, 'base64');
    console.log("decoded:",decodedData.toString('utf-8'));


    const keyBuffer = Buffer.from(key, 'base64').toString('utf-8');
    const ivBuffer = Buffer.from(iv, 'base64').toString('utf-8');
    
    const encryptedData = CryptoJS.AES.encrypt("This is my message", "770A8A65DA156D24EE2A093277530142", {iv: "I4iXzt1r2VR4qahC05/v2g=="});

    console.log("encrypted:", encryptedData.ciphertext.toString(CryptoJS.enc.Base64));  

    const bytes = CryptoJS.AES.decrypt("Icc7/ESd6wvQu2dyFaT9EOH2bA8lZ/G4OPIvN0G65Vc=", "770A8A65DA156D24EE2A093277530142", {iv: "I4iXzt1r2VR4qahC05/v2g=="});
    if(bytes.sigBytes > 0)
     { const decryptedData = bytes.toString(CryptoJS.enc.Utf8);
    console.log(decryptedData);
     }
     else console.log("Empty");
  }
  catch (err) {
    // console.log(err.toString())
    return {"error": err.toString()}
  }
}
test();