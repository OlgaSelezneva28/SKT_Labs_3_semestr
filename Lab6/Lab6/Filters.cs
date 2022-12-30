using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Drawing;
using System.ComponentModel;


namespace Lab6
{
    abstract class Filters
    {

        protected abstract Color calculateNewPixelColor(Bitmap Source, int W, int H);

        public abstract Bitmap processImage(Bitmap sourceImage, BackgroundWorker worked);

        public int Clamp(int value, int min, int max)
        {
            if (value < min)
                return min;
            if (value > max)
                return max;
            return value;
        }
    };

    //Инверсия 
    
    class InvertFilter:  Filters
    {
        protected override Color calculateNewPixelColor(Bitmap Source, int W, int H)
        {
            
            Color sourceColor = Source.GetPixel(W, H);
            Color result = Color.FromArgb(255 - sourceColor.R, 255 - sourceColor.G, 255 - sourceColor.B);

            return result;
        }

        public override Bitmap processImage(Bitmap sourceImage, BackgroundWorker worked)
        {
            Bitmap resultImage = new Bitmap(sourceImage.Width, sourceImage.Height);

            for (int i = 0; i < sourceImage.Width; i++)
            {
                worked.ReportProgress((int)((float)i / resultImage.Width * 100));
                if (worked.CancellationPending)
                {
                    return null;
                }
                for (int j = 0; j < sourceImage.Height; j++)
                {
                    resultImage.SetPixel(i, j, calculateNewPixelColor(sourceImage, i, j));
                }
            }
            return resultImage;
        }
    };

    /*----------------------------------------------------------------------------------------------------*/
    /* Матричные фильтры*/

    class matrixFilters : Filters
    {
        protected float[,] kernel = null;


        protected matrixFilters() { }

        public matrixFilters(float[,] kernel)
        {
            this.kernel = kernel;
        }

        protected override Color calculateNewPixelColor(Bitmap Source, int W, int H)
        {

            int radX = kernel.GetLength(0) / 2;
            int radY = kernel.GetLength(1) / 2;
            float resR = 0;
            float resG = 0;
            float resB = 0;

            for (int i = -radY; i <= radY; i++)
            {
                for (int j = -radX; j <= radX; j++)
                {
                    int iX = Clamp(W + j, 0, Source.Width - 1);
                    int iY = Clamp(H + i,0, Source.Height - 1);
                    Color neighbor = Source.GetPixel(iX,iY);
                    resR += neighbor.R * kernel[j + radX, i + radY];
                    resG += neighbor.G * kernel[j + radX, i + radY];
                    resB += neighbor.B * kernel[j + radX, i + radY];
                }
            }

            return Color.FromArgb(Clamp((int)resR, 0, 255), Clamp((int)resG, 0, 255), Clamp((int)resB, 0, 255));
        }

        public override Bitmap processImage(Bitmap sourceImage, BackgroundWorker worked)
        {
            Bitmap resultImage = new Bitmap(sourceImage.Width, sourceImage.Height);

            for (int i = 0; i < sourceImage.Width; i++)
            {
                worked.ReportProgress((int)((float)i / resultImage.Width * 100));
                if (worked.CancellationPending)
                {
                    return null;
                }
                for (int j = 0; j < sourceImage.Height; j++)
                {
                    resultImage.SetPixel(i, j, calculateNewPixelColor(sourceImage, i, j));
                }
            }
            return resultImage;
        }

    };

    //Размытие 

    class BlurFilter : matrixFilters
    {
        public BlurFilter()
        {
            int sizeX = 3;
            int sizeY = 3;
            kernel = new float[sizeX,sizeY];
            for (int i = 0; i < sizeX; i++)
            {
                for (int j = 0; j < sizeY; j++)
                {
                    kernel[i, j] = 1.0f / (float)(sizeX * sizeY);
                }
            }
        }

    };

    //Фильтр Гаусса

    class GausFilter : matrixFilters
    {
        public void GKernel(int rad, float sigma)
        {
            int size = 2 * rad + 1;
            kernel = new float [size, size];
            float norm = 0;
            for (int i = -rad; i <= rad; i++)
            {
                for (int j = -rad; j <= rad; j++)
                {
                    kernel[i + rad, j + rad] = (float)(Math.Exp(-(i * i + j * j) / (2 * sigma * sigma)));
                    norm+= kernel[i + rad, j + rad];
                }
            }

            // Нормировка ядра 
            for (int i = 0; i < size; i++)
            {
                for (int j = 0; j < size; j++)
                    kernel[i, j] /= norm;
            }
        }

        public GausFilter()
        {
            GKernel(3,2);
        }
    };

    /*-----------------------------------------------------------------------------------------------*/
    /* Серый */

    class GrayScale : Filters
    {
        protected override Color calculateNewPixelColor(Bitmap Source, int W, int H)
        {
            Color sourceColor = Source.GetPixel(W, H);
            double Int = 0.299 * sourceColor.R + 0.587 * sourceColor.G + 0.114 * sourceColor.B;

            Color result = Color.FromArgb((int)Int, (int)Int, (int)Int);

            return result;
        }

        public override Bitmap processImage(Bitmap sourceImage, BackgroundWorker worked)
        {
            Bitmap resultImage = new Bitmap(sourceImage.Width, sourceImage.Height);

            for (int i = 0; i < sourceImage.Width; i++)
            {
                worked.ReportProgress((int)((float)i / resultImage.Width * 100));
                if (worked.CancellationPending)
                {
                    return null;
                }
                for (int j = 0; j < sourceImage.Height; j++)
                {
                    resultImage.SetPixel(i, j, calculateNewPixelColor(sourceImage, i, j));
                }
            }
            return resultImage;
        }
    };

    /*-----------------------------------------------------------------------------------------------*/
    /* Сепия */

    class Sepia : Filters
    {
        protected override Color calculateNewPixelColor(Bitmap Source, int W, int H)
        {
            Color sourceColor = Source.GetPixel(W, H);
            double k = 30.0;
            double Int = 0.299 * sourceColor.R + 0.587 * sourceColor.G + 0.114 * sourceColor.B;
            int R = (int)(Int + 2.0 * k);
            //R = Clamp(R, W, H);
            int G = (int)(Int + 0.5 * k);
            //G = Clamp(G, W,H);
            int B = (int)(Int - k);
            //B = Clamp(B,W,H);
            Color result = Color.FromArgb(Clamp(R, 0, 255),Clamp(G, 0, 255), Clamp(B, 0 , 255));

            return result;
        }

        public override Bitmap processImage(Bitmap sourceImage, BackgroundWorker worked)
        {
            Bitmap resultImage = new Bitmap(sourceImage.Width, sourceImage.Height);

            for (int i = 0; i < sourceImage.Width; i++)
            {
                worked.ReportProgress((int)((float)i / resultImage.Width * 100));
                if (worked.CancellationPending)
                {
                    return null;
                }
                for (int j = 0; j < sourceImage.Height; j++)
                {
                    resultImage.SetPixel(i, j, calculateNewPixelColor(sourceImage, i, j));
                }
            }
            return resultImage;
        }
    };

    /*-----------------------------------------------------------------------------------------------*/
    /* Увеличение яркости */

    class bright : Filters
    {
        protected override Color calculateNewPixelColor(Bitmap Source, int W, int H)
        {
            Color sourceColor = Source.GetPixel(W, H);

            Color result = Color.FromArgb(Clamp(sourceColor.R + 20, 0, 255), Clamp(sourceColor.G + 20, 0, 255), Clamp(sourceColor.B + 20, 0, 255));

            return result;
        }

        public override Bitmap processImage(Bitmap sourceImage, BackgroundWorker worked)
        {
            Bitmap resultImage = new Bitmap(sourceImage.Width, sourceImage.Height);

            for (int i = 0; i < sourceImage.Width; i++)
            {
                worked.ReportProgress((int)((float)i / resultImage.Width * 100));
                if (worked.CancellationPending)
                {
                    return null;
                }
                for (int j = 0; j < sourceImage.Height; j++)
                {
                    resultImage.SetPixel(i, j, calculateNewPixelColor(sourceImage, i, j));
                }
            }
            return resultImage;
        }
    };

    /*-----------------------------------------------------------------------------------------------*/
    /* Фильтр Собеля  */

    class Sobel : matrixFilters
    {
        public Sobel()
        {
            int sX = 3;
            int sY = 3;
            kernel = new float[sX, sY];
            kernel[0,0] = -1;
            kernel[1,0] = -2;
            kernel[2,0] = -1;
            for (int i = 0; i < sX; i ++)
                for (int j = 1; j < sY; j++)
                {
                    if (j == 1)
                    {
                        kernel[i,j] = 0;
                    }

                    if (j == 2)
                    {
                        kernel[i,j] = - kernel[i,0];
                    }
                }
        }
    };

    /*-----------------------------------------------------------------------------------------------*/
    /* Повысить резкость  */

    class Sharpness : matrixFilters
    {
        public Sharpness()
        {
            int X = 3;
            int Y = 3;
            kernel = new float[X,Y];
            kernel[0,0] = 0;
            kernel[1,0] = -1;
            kernel[2,0] = 0;
            kernel[0,1] = -1;
            kernel[1,1] = 5;
            kernel[2, 1] = -1;
            kernel[0, 2] = 0;
            kernel[1, 2] = -1;
            kernel[2, 2] = 0;
        }

    };

    /*-----------------------------------------------------------------------------------------------*/
    /* Серый мир  */

    class GrayWorld: Filters
    {
        public int Avg;
        public int R, G, B;

        protected override Color calculateNewPixelColor(Bitmap Source, int W, int H)
        {
            Color sourceColor = Source.GetPixel(W, H);

            Color result = Color.FromArgb(Clamp(sourceColor.R * Avg / R, 0, 255), Clamp(sourceColor.G * Avg / G, 0, 255), Clamp(sourceColor.B * Avg / B, 0, 255));
            return result;
        }

        public override Bitmap processImage(Bitmap sourceImage, BackgroundWorker worked)
        {
            Bitmap resultImage = new Bitmap(sourceImage.Width, sourceImage.Height);
            R = 0; G = 0; B = 0; Avg = 0;
            for (int i = 0; i < sourceImage.Width; i++)
            {
                for (int j = 0; j < sourceImage.Height; j++)
                {
                    Color sourceColor = sourceImage.GetPixel(i, j);
                    R += sourceColor.R;
                    G += sourceColor.G;
                    B += sourceColor.B;
                }
            }
            int size = sourceImage.Width * sourceImage.Height;
            R = R / size;
            G = G / size;
            B = B / size;
            Avg = (R + G + B) / 3;

            for (int i = 0; i < sourceImage.Width; i++)
            {
                worked.ReportProgress((int)((float)i / sourceImage.Width * 100));
                if (worked.CancellationPending)
                    return null;
                for (int j = 0; j < sourceImage.Height; j++)
                    resultImage.SetPixel(i, j, calculateNewPixelColor(sourceImage, i, j));
            }
            return resultImage;
        }
    };

    /*-----------------------------------------------------------------------------------------------*/
    /* Идеальный отражатель */

    class PerfectReflector:Filters
    {
        public int F(int x, int xmax)
        {
            return Clamp((x*255/xmax),0,255);
        }

        protected override Color calculateNewPixelColor(Bitmap Source, int W, int H)
        {
            return Source.GetPixel(W, H);
        }

        public override Bitmap processImage(Bitmap sourceImage, BackgroundWorker worked)
        {
            Bitmap resultImage = new Bitmap(sourceImage.Width, sourceImage.Height);
            int maxR = 0; int maxG = 0; int maxB = 0;
            for (int i = 0; i < sourceImage.Width; i++)
            {
                for (int j = 0; j < sourceImage.Height; j++)
                {
                    Color sourceColor = sourceImage.GetPixel(i, j);
                    if (sourceColor.R > maxR)
                        maxR = sourceColor.R;
                    if (sourceColor.G > maxG)
                        maxG = sourceColor.G;
                    if (sourceColor.B > maxB)
                        maxB = sourceColor.B;
                }
            }

            for (int i = 0; i < sourceImage.Width; i++)
            {
                worked.ReportProgress((int)((float)i / sourceImage.Width * 100));
                if (worked.CancellationPending)
                {
                    return null;
                }
                for (int j = 0; j < sourceImage.Height; j++)
                {
                    int R = sourceImage.GetPixel(i, j).R;
                    int G = sourceImage.GetPixel(i, j).G;
                    int B = sourceImage.GetPixel(i, j).B;

                    resultImage.SetPixel(i, j, Color.FromArgb(F(R, maxR), F(G, maxG), F(B, maxB)));
                }
            }
            return resultImage;
        }
    };

    /*-----------------------------------------------------------------------------------------------*/
    /* Коррекция с опорным цветом */

    class CorrectionWithAReferenceColor :Filters
    {
        Color main;

        public CorrectionWithAReferenceColor(Color m)
        {
             main = new Color();
             main = m;
        }

        public int F(int x,int dst, int src)
        {
            return Clamp((int)(x * dst / src ), 0, 255);
        }

        protected override Color calculateNewPixelColor(Bitmap Source, int W, int H)
        {
            return Source.GetPixel(W, H);
        }

        public override Bitmap processImage(Bitmap sourceImage, BackgroundWorker worked)
        {
            Bitmap resultImage = new Bitmap(sourceImage.Width, sourceImage.Height);
            int Rsrc = 0; int Gsrc = 0; int Bsrc = 0;
            int Rdst = main.R; int Gdst = main.G; int Bdst = main.B;

            for (int i = 0; i < sourceImage.Width; i++)
            {
                for (int j = 0; j < sourceImage.Height; j++)
                {
                    Color sourceColor = sourceImage.GetPixel(i, j);
                    if (sourceColor.R > Rsrc)
                        Rsrc = sourceColor.R;
                    if (sourceColor.G > Gsrc)
                        Gsrc = sourceColor.G;
                    if (sourceColor.B > Bsrc)
                        Bsrc = sourceColor.B;
                }
            }

            for (int i = 0; i < sourceImage.Width; i++)
            {
                worked.ReportProgress((int)((float)i / sourceImage.Width * 100));
                if (worked.CancellationPending)
                {
                    return null;
                }
                for (int j = 0; j < sourceImage.Height; j++)
                {
                    int R = sourceImage.GetPixel(i, j).R;
                    int G = sourceImage.GetPixel(i, j).G;
                    int B = sourceImage.GetPixel(i, j).B;

                    resultImage.SetPixel(i, j, Color.FromArgb(F(R, Rdst,Rsrc), F(G, Gdst, Gsrc), F(B, Bdst, Bsrc)));
                }
            }
            return resultImage;
        }
    };

    /*-----------------------------------------------------------------------------------------------*/
    /* Линейное растяжение гистограммы  */
    class StretchingTheHistogram : Filters 
    {
        public int F(int y, int ymax, int ymin)
        {
            return Clamp(((255 * (y - ymin)) / (ymax - ymin)), 0, 255);
        }
        protected override Color calculateNewPixelColor(Bitmap Source, int W, int H)
        {
            return Source.GetPixel(W, H);
        }
        public override Bitmap processImage(Bitmap sourceImage, BackgroundWorker worked)
        {
            Bitmap result = new Bitmap(sourceImage.Width, sourceImage.Height);
            int minR = 0;
            int maxR = 0;
            int minG = 0;
            int maxG = 0;
            int minB = 0;
            int maxB = 0;
            for (int i = 0; i < sourceImage.Width; i++)
            {
                for (int j = 0; j < sourceImage.Height; j++)
                {
                    Color pixColor = sourceImage.GetPixel(i, j);
                    if (minR > pixColor.R)
                        minR = pixColor.R;
                    if (maxR < pixColor.R)
                        maxR = pixColor.R;
                    if (minG > pixColor.G)
                        minG = pixColor.G;
                    if (maxG < pixColor.G)
                        maxG = pixColor.G;
                    if (minB > pixColor.B)
                        minB = pixColor.B;
                    if (maxB < pixColor.B)
                        maxB = pixColor.B;
                }
            }

            for (int i = 0; i < sourceImage.Width; i++)
            {
                worked.ReportProgress((int)((float)i / sourceImage.Width * 100));
                if (worked.CancellationPending)
                {
                    return null;
                }
                for (int j = 0; j < sourceImage.Height; j++)
                {
                    int R = sourceImage.GetPixel(i, j).R;
                    int G = sourceImage.GetPixel(i, j).G;
                    int B = sourceImage.GetPixel(i, j).B;
                    result.SetPixel(i, j, Color.FromArgb(F(R, maxR, minR), F(G, maxG, minG), F(B, maxB, minB)));
                }
            }
            return result;
        }
    };

    /*-----------------------------------------------------------------------------------------------*/
    /* Стекло  */

    class glass: Filters 
    {
        protected override Color calculateNewPixelColor(Bitmap Source, int W, int H)
        {
            Random R = new Random();
            int X = Clamp((int)(W + R.NextDouble()* 10.0 - 5 ), 0, Source.Width - 1);
            int Y = Clamp((int)(H + R.NextDouble()* 10.0 - 5 ), 0, Source.Height - 1);
            Color result = Source.GetPixel(X, Y);
            return result;
        }

        public override Bitmap processImage(Bitmap sourceImage, BackgroundWorker worked)
        {
            Bitmap resultImage = new Bitmap(sourceImage.Width, sourceImage.Height);

            for (int i = 0; i < sourceImage.Width; i++)
            {
                worked.ReportProgress((int)((float)i / resultImage.Width * 100));
                if (worked.CancellationPending)
                {
                    return null;
                }
                for (int j = 0; j < sourceImage.Height; j++)
                {
                    resultImage.SetPixel(i, j, calculateNewPixelColor(sourceImage, i, j));
                }
            }
            return resultImage;
        }
    };

    /*-----------------------------------------------------------------------------------------------*/
    /* Motion blur  */

    class MotionBlur : matrixFilters
    {
        public MotionBlur()
        {
            int sizeX = 3;
            int sizeY = 3;
            kernel = new float[sizeX,sizeY];
            for (int i = 0; i < sizeX; i++)
            {
                for (int j = 0; j < sizeY; j++)
                {
                    kernel[i, j] = 0;
                    if (i == j)
                    {
                        kernel[i, j] = 1.0f / (float)(sizeX);
                    }
                }
            }
        }
    };

    /*-----------------------------------------------------------------------------------------------*/
    /* Резкость  */

    class sharpness : matrixFilters
    {
        public sharpness()
        {
            int X = 3;
            int Y = 3;
            kernel = new float[X,Y];
            kernel[0,0] = -1;
            kernel[1,0] = -1;
            kernel[2,0] = -1;
            kernel[0,1] = -1;
            kernel[1,1] = 9;
            kernel[2, 1] = -1;
            kernel[0, 2] = -1;
            kernel[1, 2] = -1;
            kernel[2, 2] = -1;
        }
    };
};
     



