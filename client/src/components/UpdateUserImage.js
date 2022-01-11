import React, { useState } from 'react';
import ReactDOM from 'react-dom';

// Import React FilePond
import { FilePond, registerPlugin } from 'react-filepond';

// Import FilePond styles
import 'filepond/dist/filepond.min.css';

// Import the Image EXIF Orientation and Image Preview plugins
// Note: These need to be installed separately
// `npm i filepond-plugin-image-preview filepond-plugin-image-exif-orientation --save`
import FilePondPluginImageExifOrientation from 'filepond-plugin-image-exif-orientation';
import FilePondPluginImagePreview from 'filepond-plugin-image-preview';
import 'filepond-plugin-image-preview/dist/filepond-plugin-image-preview.css';

// Register the plugins
registerPlugin(FilePondPluginImageExifOrientation, FilePondPluginImagePreview);

// Our app
const UpdateUserImage = () => {
    const [files, setFiles] = useState([]);

    const handleUpdate = (files) =>{
      console.log(files)
      console.log(files[0])
      console.log(files[0].file)
      setFiles(files)
    };

    const handleSubmit = (e) =>{
      e.preventDefault();
      console.log("handle Submit Clicked")
      console.log(files)
    }

    return (
        <div className="App">
          <h1>Only one photo and don't do api call onChange</h1>
          <form onSubmit = {handleSubmit}>
            <FilePond
                files={files}
                onupdatefiles={handleUpdate}
                allowMultiple={false}
                name="files"
                labelIdle='Drag & Drop your files or <span class="filepond--label-action">Browse</span>'
            />
            <p>email</p>
            <input />
            <button type = "submit">update</button>
            </form>
        </div>
    );
}

export default UpdateUserImage;