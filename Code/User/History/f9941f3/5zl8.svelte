<script>
    import PdfViewer from "svelte-pdf-scrollable";
    import * as pdfjs from 'pdfjs-dist';
    import pdfjsWorker from 'pdfjs-dist/build/pdf.worker.min.js?url';
    pdfjs.GlobalWorkerOptions.workerSrc = pdfjsWorker;
</script>

<PdfViewer
    url="/Dylan_Calvin.pdf"
    style="
        position: absolute;
        top: 5rem;
        left: 50%;
        transform: translate(-50%);
        width: 900px;
        height: 800px;
        outline-style: solid;
        outline-width: 1px;
        outline-offset: 0px;
    "
    scale={0.8}
/>