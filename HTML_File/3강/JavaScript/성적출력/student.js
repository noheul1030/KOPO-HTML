class student {
    id;
    name;
    kor;
    eng;
    mat;
    sum;
    avg;
    constructor(id,name,kor,eng,mat){
        this.id = id;
        this.name=name;
        this.kor=kor;
        this.eng=eng;
        this.mat=mat;
        this.sum=kor+eng+mat;
        this.avg=Math.floor((kor+eng+mat)/3);
    }
}
