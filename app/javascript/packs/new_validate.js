// this code is not working
$("#new_post").validate({
    rules: {
      "post[title]": {
        required: true,
        minlength: 2
      },
      "post[body]": {
        required: true,
        minlength: 5
      }
    },
    messages: {
      "post[title]": {
        required: "We need to put your title here !"
      },
      "post[body]": {
        required: "We need to put your content here !"
      }
    }
    });