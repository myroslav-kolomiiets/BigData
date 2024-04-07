const date = new Date();

const options = {
    hour: '2-digit',
    minute: '2-digit',
    weekday: 'long',
    year: 'numeric',
    month: 'long',
    day: 'numeric',
};

console.log(date.toLocaleDateString('en-EN', options));
console.log('Myroslav Kolomiiets');
