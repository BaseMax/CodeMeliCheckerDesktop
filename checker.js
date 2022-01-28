const checkCodeMeli = (code) => {
   const bads = ["0000000000", "1111111111","2222222222","3333333333","4444444444","5555555555","6666666666","7777777777","8888888888","9999999999"];

   // Return false If `code` is null or undefined
   if (!code) return false;

   // if `code` type is Number, So cast it to String. Also trim the `code``
   code = code.toString().trim();

   // Return false if `code` has a character which is not digit
   // If it's hard to use REGEX, you can loop the `numbers` elements and check these.
   if(/^\d+$/.test(code) === false)
      return false;

   // Convert `code` String to array of digits (Only a digit on each place of array)
   const numbers = code.split("").map(i => +i);

   // Return false if `code` has a character which is not digit
   // Hint for other languages: if (/[^\d]/.test(number)) return false;
   // for(const number of numbers)
   //    if(isNaN(number))
   //       return false;

   // console.log(code);
   // console.log(numbers)
   // console.log(numbers.at(-1))

   // Check badCodes
   for(const bad of bads)
      if(code === bad)
         return false;

   if(code.length !== 10)
      return false;

   console.log(code);

   // if(numbers[3] === 0 && numbers[4] === 0 && numbers[5] === 0)
   //    return false;

   let s = 0;
   for(let i = 0;i < 9;i++)
      s += parseInt(code.charAt(i), 10) * (10 - i);
   s = s % 11;

   return (s < 2 && numbers.at(-1) === s) ||
          (s >= 2 && numbers.at(-1) === (11-s));
};

console.assert(true === checkCodeMeli("1690000007"));
console.assert(true === checkCodeMeli("1690000015"));
console.assert(true === checkCodeMeli("1690000023"));
console.assert(true === checkCodeMeli("1690000031"));
console.assert(true === checkCodeMeli("1690000041"));
console.assert(true === checkCodeMeli("1690000058"));
console.assert(true === checkCodeMeli("1690000066"));
console.assert(true === checkCodeMeli("1690000074"));
console.assert(true === checkCodeMeli("1690000082"));
console.assert(true === checkCodeMeli("1690000090"));
console.assert(true === checkCodeMeli("1690000104"));
console.assert(true === checkCodeMeli("1690000112"));
console.assert(true === checkCodeMeli("1690000120"));
console.assert(true === checkCodeMeli("1690000139"));
console.assert(true === checkCodeMeli("1690000147"));
console.assert(true === checkCodeMeli("1690000155"));
console.assert(true === checkCodeMeli("1690000163"));
console.assert(true === checkCodeMeli("1690000171"));
console.assert(true === checkCodeMeli("1690000181"));
console.assert(true === checkCodeMeli("1690000198"));
console.assert(true === checkCodeMeli("1690000201"));
console.assert(true === checkCodeMeli("1690000211"));
console.assert(true === checkCodeMeli("1690000228"));
console.assert(true === checkCodeMeli("1690000236"));
console.assert(true === checkCodeMeli("1690000244"));
console.assert(true === checkCodeMeli("1690000252"));
console.assert(true === checkCodeMeli("1690000260"));
console.assert(true === checkCodeMeli("1690000279"));
console.assert(true === checkCodeMeli("1690000287"));
console.assert(true === checkCodeMeli("1690000295"));
console.assert(true === checkCodeMeli("1690000309"));
console.assert(true === checkCodeMeli("1690000317"));
console.assert(true === checkCodeMeli("1690000325"));
console.assert(true === checkCodeMeli("1690000333"));
console.assert(true === checkCodeMeli("1690000341"));
console.assert(true === checkCodeMeli("1690000351"));
console.assert(true === checkCodeMeli("1690000368"));
console.assert(true === checkCodeMeli("1690000376"));
console.assert(true === checkCodeMeli("1690000384"));
console.assert(true === checkCodeMeli("1690000392"));
console.assert(true === checkCodeMeli("1690000406"));
console.assert(true === checkCodeMeli("1690000414"));
console.assert(true === checkCodeMeli("1690000422"));
console.assert(true === checkCodeMeli("1690000430"));
console.assert(true === checkCodeMeli("1690000449"));
console.assert(true === checkCodeMeli("1690000457"));

console.assert(false === checkCodeMeli("1250580831"));
console.assert(false === checkCodeMeli("1250481832"));
console.assert(false === checkCodeMeli("1230584833"));
console.assert(false === checkCodeMeli("1250545834"));
console.assert(false === checkCodeMeli("1220589836"));
console.assert(false === checkCodeMeli("1250589637"));
console.assert(false === checkCodeMeli("1250583838"));
console.assert(false === checkCodeMeli("1250585839"));
console.assert(false === checkCodeMeli("1250580830"));
console.assert(false === checkCodeMeli("1111111111"));
console.assert(false === checkCodeMeli("1110001111"));

console.log("-------------")
console.assert(false === checkCodeMeli("Hi"));
