import cv2
import ezdxf

def detect_edges(image_path):
    # Read the image
    image = cv2.imread(image_path)
    
    # Convert the image to grayscale
    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    
    # Apply Canny edge detection
    edges = cv2.Canny(gray, 100, 200)
    
    # Find contours
    contours, _ = cv2.findContours(edges, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
    
    return contours

def export_dwg(contours, output_path):
    doc = ezdxf.new("R2010")  # Create a new DXF document
    msp = doc.modelspace()  # Get the model space

    for contour in contours:
        points = [tuple(point[0]) for point in contour]
        msp.add_lwpolyline(points)  # Add the contour as a polyline

    doc.saveas(output_path)  # Save the DXF file

if __name__ == "__main__":
    # Input image path
    image_path = "LurleenWallace1.jpg"
    
    # Detect edges
    contours = detect_edges(image_path)
    
    # Output DWG path
    output_path = "detected.dwg"
    
    # Export contours as DWG
    export_dwg(contours, output_path)