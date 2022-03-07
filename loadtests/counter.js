import counter from "k6/x/counter"

export const options = {
    duration: ".5m",
    vus: 5,
    iterations: 10,
};

export default function () {
    console.log(counter.up(), __VU, __ITER)
}
