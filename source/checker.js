const checkCodeMelli = (code) => {
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

   return (s < 2 && numbers[numbers.length-1]=== s) ||
          (s >= 2 && numbers[numbers.length-1] === (11-s));
};
