```
    <script src="folderName/jquery/jquery.js"></script>
```

```
    <script>
        $(document.ready(function()){

        });
```

```
    <script>
        $(function(){

            $('#element-id).hide();
            $('#element-id).hide(300).show(1000);
            $('#element-id).slideUp(1000).delay(1000).slideDown(1000);
            $('#element-id).fadeOut(1000).delay(1000).slideDown(1000);
            $('#element-id).fadeToggle(1000).fadeToggle(1000);
            $('#element-id).slideToggle(1000).slideToggle(1000);
            $('#element-id).toggle(1000).toggle(1000);

            $('#element-id).css({color:'red'});
            $('#element-id).css({color:'red', fontWeight: 'bold'});
            
            $('#element-id').css({
                color:'red', 
                'font-weight': 'bold',
                display: none;
            });

            $('#element-id').css({opacity: '0.5'});

            $('#panel1').html('my panel <strong> my bold</strong>)'

            $('#element-id').on('click', function() {
                $('#element-id2').slideToggle(200);
            })

            $('#element-id').on('mouseover', function() {
                $('#element-id2').slideToggle(200);
            })

            $('#element-id').on('click', function(){
                $('#element-id').html('my new panel content');
            })

            $('.class-name').on('click', function(){
                var panelId = $(this).attr('data-panelid');
                $('#'+panelId).toggle();
            })

        })
    </script>
```