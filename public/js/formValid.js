
    function validate() {
   
        let formfields= document.forms['product'].getElementsByClassName('form-control');

        for(let i=0;i<formfields.length;i++){
            if(formfields[i].value ==''){
                formfields[i].style.background = 'red';
            }
        }
     }